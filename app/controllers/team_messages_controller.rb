# This is just another controller for Message.rb
# * This is to keep the views and actions for Team and User Messages separate.
class TeamMessagesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @messages = Message.get_unread_team_messages(current_user)
    @teams = current_user.teams.all
    @message_partial = "message"
    
    respond_to do |format|
      format.js 
    end
  end
  
  # Sets the Team message_editor via AJAX
  def new
    @message = Message.new(team_id: params[:message][:team_id])

    respond_to do |format|
      format.js
    end
  end
  
  # This creates a new parent(root) message
  def create
    @message = Message.new
    @message.recipient_id = nil
    @message.sender_id = current_user.id
    @message.school_id = session[:school_id] if session[:school_id]
    @message.team_id = params[:message][:team_id].to_i
    @message.subject = params[:message][:subject]
    @message.body = params[:message][:body]
    
    respond_to do |format|
      if @message.save
        format.js 
      else
        format.js {render "shared/save_failed"}
      end
    end
  end
  
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
  def save_reply
    @id = params[:id]
    parent = Message.find(params[:id])
    @reply = parent.children.create(:sender_id=>params[:sender_id].to_i)
    @reply.team_id = params[:team_id].to_i
    @reply.body = params[:body]
   
    respond_to do |format|
      if @reply.save
        format.js
      else
        format.js {render "shared/save_failed"}
      end
    end
  end
  
  # This removes the message editor
  def cancel_message
    respond_to do |format|
      format.js 
    end
  end
  
  # This removes the reply editor
  def cancel_reply
    @message = Message.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  # Destroys the message and all children.
  def destroy
    @message = Message.find(params[:id])
    @id = @message.id.to_s
    @message.destroy

    respond_to do |format|
      format.js
    end
  end


  
  private
  
end
