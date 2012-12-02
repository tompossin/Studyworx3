class MessagesController < ApplicationController
  
  
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
    pagesize = 5 # set number of messages to display at once. Could be user defined someday.
    @page = params[:page].to_i||0  
    @messages = Message.get_read_messages(current_user.id,pagesize,@page)
    count = Message.count_all_messages(current_user.id)
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

  # Sets the editor via AJAX
  def new
    @message = Message.new

    respond_to do |format|
      format.js
    end
  end

  # Marks the parent message as read
  def read
    m = Message.mark_as_read(params[:id],current_user.id)
    @id = m.id.to_s
    respond_to do |format|
      format.js {render "destroy"}
    end
  end
  
  # creates a blank reply(no save) and loads the editor
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
  
  # Takes user reply and creates a child message and pushes it to the view. 
  # This message is designed to function with only parents and children no grandchildren.
  def save_reply
    @id = params[:id] # parent message id
    parent = Message.mark_parent_as_unread(@id)
    @reply = parent.children.create(:sender_id=>params[:sender_id].to_i)
    @reply.recipient_id = params[:recipient_id].to_i
    @reply.team_id = nil
    @reply.body = params[:body]
    @reply.recipient_read = false
    @reply.sender_read = false
   
    respond_to do |format|
      if @reply.save
        format.js
      else
        format.js {render "shared/save_failed"}
      end
    end
  end

  # This creates a new parent message
  def create
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
        format.js 
      else
        format.js {render "shared/save_failed"}
      end
    end
  end

  # Not used yet
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
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
  def destroy
    @message = Message.find(params[:id])
    @id = @message.id.to_s
    @message.destroy

    respond_to do |format|
      format.js
    end
  end
end
