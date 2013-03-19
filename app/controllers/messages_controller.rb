class MessagesController < ApplicationController
  before_filter :authenticate_user!
  
  # ----------
  # :section: Message Methods (parent)
  # This section contains methods for manipulating Personal Messages (parent).
  # ----------
  
  # Loading user unread personal conversations via AJAX
  def index
    @messages = Message.get_unread_messages(current_user.id)
    @message_partial = "message"
    respond_to do |format|
      format.js
    end
  end
  
  # Show read personal messages by page
  def get_read
    pagesize = Settings.pagesize # set number of messages to display at once. Could be user defined someday.
    @page = params[:page].to_i||0  
    @messages = Message.get_read_messages(current_user.id,pagesize,@page)
    count = Message.count_all_read_messages(current_user.id)
    @page += 1
    @current_count = count - pagesize*@page
    unless count <= pagesize*@page
      @linklabel = "more messages..."
    else
      @page = 0
      @linklabel = "End of messages"
    end
    @message_partial = "message_list"
    
    respond_to do |format|
      format.js { render :index }
    end
  end
  
  # Shows and individual message and it's children via AJAX.
  def show
    @message = Message.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
  
  def edit
    @message = Message.find(params[:id])
    
    respond_to do |format|
      if @message.sender_id == current_user.id
        format.js
      else
        format.js {render "shared/not_owner"}
      end
    end 
  end
  
  def cancel_message_edit
    
  end

  # Sets the new message editor via AJAX
  def new
    @message = Message.new

    respond_to do |format|
      format.js
    end
  end
  
  # This removes the new message editor via AJAX
  # FIXME This is called mistakenly by a message edit.
  def cancel_message
    respond_to do |format|
      format.js 
    end
  end

  # Marks the parent message as read
  def read
    @message = Message.toggle_read_values(params[:id],current_user.id)
    
    respond_to do |format|
      format.js {render "destroy"}
    end
  end
  
   # This creates a new parent(root) message
  def create
    recipient = User.find(params[:recipient_id])
    sender = current_user
    @message = Message.new
    @message.recipient_id = params[:recipient_id].to_i
    @message.sender_id = current_user.id
    @message.school_id = session[:school_id] if session[:school_id]
    @message.team_id = nil
    @message.subject = params[:subject]
    @message.body = params[:body]
    @message.recipient_read = false
    @message.sender_read = false
    
    respond_to do |format|
      if @message.save
        MessageMailer.user_email(sender,recipient,params[:subject],@message).deliver
        format.js 
      else
        format.js {render "shared/save_failed"}
      end
    end
  end
  
  # This updates a parent message that has already been posted
  def update
    @message = Message.find(params[:id])
    @message.subject = params[:subject]
    @message.body = params[:body]
    @message.sender_read = false
    @message.recipient_read = false
    sender = current_user
    recipient = User.find(@message.recipient_id)
    subject = "[UPDATED] "+@message.subject
    
    respond_to do |format|
      # check for shinanigans
      if @message.sender_id == current_user.id
        if @message.save
          MessageMailer.user_email(sender,recipient,subject,@message).deliver
          format.js
        else
          format.js {render "shared/save_failed"}
        end
      else
        format.js {render "shared/not_owner"}
      end 
    end
  end
  
  # ----------
  # :section: Reply Methods
  # This section contains methods specifically designed to handle reply (child) Messages.
  # ----------
  
  # creates a new reply(no save) and loads the reply_new editor
  def reply
    r = Message.find(params[:id])
    @message = Message.new
    @message.parent_id = params[:id]
    @message.sender_id = current_user.id
    @message.recipient_id = r.recipient_id
    @id = params[:id]
    
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
  
  # This loads the reply_editor in-place to update anexisting message
  # 
  def reply_edit
    @message = Message.find(params[:id])
    respond_to do |format|
      if @message.sender_id = current_user.id
        format.js
      else
        format.js {render "shared/not_owner"}
      end
    end
  end
  
  def cancel_reply_edit
    @message = Message.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
  
  # Takes user reply and creates a child message and pushes it to the view. 
  # This message system is designed to function with only parents and children no grandchildren.
  def reply_create
    @id = params[:id] # parent message id
    parent = Message.mark_parent_as_unread(@id)
    @message = parent.children.create(:sender_id=>params[:sender_id].to_i)
    @message.recipient_id = params[:recipient_id].to_i
    @message.team_id = nil
    @message.body = params[:body]
    @message.recipient_read = false
    @message.sender_read = false
    sender = current_user
    recipient = User.find(@message.parent.sender_id)
    subject = "Re: #{@message.parent.subject}"
   
    respond_to do |format|
      if @message.save
        MessageMailer.user_email(sender,recipient,subject,@message).deliver
        format.js
      else
        format.js {render "shared/save_failed"}
      end
    end
  end
  
  # This updates an existing reply
  # 
  def reply_update
    @message = Message.find(params[:id])
    parent = Message.mark_parent_as_unread(@message.id)
    @message.body = params[:body]
    @message.recipient_read = false
    sender = current_user
    recipient = User.find(@message.parent.sender_id)
    subject = "Re:[UPDATED-REPLY] #{@message.parent.subject}"
    
    respond_to do |format|
      if @message.save
        MessageMailer.user_email(sender,recipient,subject,@message).deliver
        format.js 
      else
        format.js {render "shared/save_failed"}
      end
    end
  end
  
  # ----------
  # :section: Shared Methods for Messages and Replies
  # The methods below can be called from either a message or reply context.
  # ----------
  
  # Destroys the message and all children if they exist.
  def destroy
    @message = Message.find(params[:id])
    parent = @message.parent_id
    @message.destroy
    
    respond_to do |format|
      if parent and parent > 0
        # this is a reply message (child)
        format.js {render "destroy_reply"}
      else
        # this is a parent message.
        format.js 
      end
    end
  end
end
