# This is just another controller for Message.rb
# * This is to keep the views and actions for Team and User Messages separate.
class TeamMessagesController < ApplicationController
  before_filter :authenticate_user!
  
  # ----------
  # :section: Team Messaging - Parent Message Methods
  # This section contains all the CRUD methods for Parent messages.
  # ----------
  
  # This is the main display action for Team Messages
  def index
    @page = params[:page].to_i || 0
    pagesize = 5
    @msgcount = Message.count_team_messages(current_user)
    @messages = Message.get_team_messages(current_user,pagesize,@page)
    @teams = current_user.teams.all
    @page += 1
    @current_count = @msgcount - pagesize*@page
    unless @msgcount <= pagesize*@page
      @pagelabel = "more messages..."
    else
      @page = 0
      @pagelabel = "End of messages"
    end
    
    respond_to do |format|
      format.js 
    end
  end
  
  # This loads the editor for parent messages
  def edit
    @message = Message.find(params[:id])
    @method = "put"
    
    respond_to do |format|
      format.js
    end
  end
  
  # Sets the Team message_new form via AJAX
  def new
    @message = Message.new(team_id: params[:message][:team_id])
    @method = "post"
    respond_to do |format|
      format.js
    end
  end
  
  # This creates a new parent(root) message
  def create
    @message = Message.new
    @message.recipient_id = nil
    @message.sender_id = current_user.id
    @message.school_id = current_user.school
    @message.team_id = params[:message][:team_id].to_i
    @message.subject = params[:message][:subject]
    @message.body = params[:message][:body]
    sender = current_user
    team = Team.find(params[:message][:team_id])
    
    respond_to do |format|
      if @message.save
        MessageMailer.team_email(sender,team,@message.subject,@message).deliver
        format.js 
      else
        format.js {render "shared/save_failed"}
      end
    end
  end
  
  # updates an existing parent message
  def update
    @message = Message.find(params[:id])
    sender = current_user
    team = Team.find(@message.team_id)
    subject = "[UPDATED]: #{@message.subject}"
    
    respond_to do |format|
      if @message.update_attributes(params[:message])
        MessageMailer.team_email(sender,team,subject,@message).deliver
        format.js { render :update, notice: "Message saved."}
      else
        format.js {render "shared/save_failed"}
      end
    end
  end
  
  # This removes the new message editor
  def cancel_message
    respond_to do |format|
      format.js 
    end
  end
  
  # This removes the inplace message editor
  def cancel_edit
    @message = Message.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
  
  # ----------
  # :section: Team Message Reply Methods
  # These Methods handle the basic CRUD methods for replies(child messages)
  # ----------
  
  # creates a blank reply(no save) and loads the reply editor
  def reply
    r = Message.find(params[:id])
    @message = Message.new
    @message.parent_id = params[:id]
    @message.sender_id = current_user.id
    @message.team_id = r.team_id
    @id = params[:id]
    
    respond_to do |format|
      format.js
    end
  end
  
  # Takes user reply and creates a child message and pushes it to the view. 
  # This message system is designed to function with only parents and children no grandchildren.
  def reply_create
    @id = params[:id]
    parent = Message.find(params[:id])
    @message = parent.children.create(:sender_id=>params[:sender_id].to_i)
    @message.team_id = params[:team_id].to_i
    @message.body = params[:body]
    sender = current_user
    team = Team.find(params[:team_id])
    subject = "Re: #{@message.parent.subject}"
   
    respond_to do |format|
      if @message.save
        MessageMailer.team_email(sender,team,subject,@message).deliver
        format.js
      else
        format.js {render "shared/save_failed"}
      end
    end
  end
  
  # This loads the inplace reply editor for child messages
  def reply_edit
    @message = Message.find(params[:id])
    @id = params[:id]
    
    respond_to do |format|
      format.js
    end
  end
  
  # This updates existing reply (child) records
  def reply_update
    @message = Message.find(params[:id])
    sender = current_user
    team = Team.find(@message.team_id)
    subject = "[UPDATED] Re: #{@message.parent.subject}"
    
    respond_to do |format|
      if @message.update_attributes(params[:message])
        MessageMailer.team_email(sender,team,subject,@message).deliver
        format.js
      else
        format.js {render "shared/save_failed"}
      end
    end
  end
  
  # This removes the new reply editor
  def cancel_reply
    @message = Message.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
  
  # This removes the inplace reply editor
  def cancel_reply_edit
    @message = Message.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # ----------
  # :section: Shared Methods
  # These methods are used for either Parent or Child messages
  # ----------
  
  # Destroys the message and all children if any exist.
  def destroy
    @message = Message.find(params[:id])
    @child = @message.parent_id||false
    @id = @message.id.to_s
    @message.destroy

    respond_to do |format|
      unless @child
        format.js
      else
        format.js {render "reply_destroy"}
      end  
    end
  end


  
  private
  
end
