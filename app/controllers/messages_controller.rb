class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new

    respond_to do |format|
      format.js
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end
  
  def reply
    @message = Message.new
    @message.parent_id = params[:id]
    @message.sender_id = current_user.id
    @message.recipient_id = params[:id]
    
    respond_to do |format|
      format.js
    end
  end
  
  def save_reply
    msg = Message.find(params[:id])
    @reply = msg.children.create(:sender_id=>params[:sender_id].to_i)
    @reply.recipient_id = params[:recipient_id].to_i
    @reply.body = params[:body]
    @reply.has_read = false
    @reply.archived = false
    @reply.sender_trashed = false
    @reply.recipient_trashed = false
    @reply.save
    
    respond_to do |format|
      format.js
    end
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new
    @message.recipient_id = params[:recipient_id].to_i
    @message.sender_id = current_user.id
    @message.school_id = session[:school_id] if session[:school_id]
    @message.subject = params[:subject]
    @message.body = params[:body]
    @message.has_read = false
    @message.archived = false
    @message.sender_trashed = false
    @message.recipient_trashed = false
    @message.save

    respond_to do |format|
      if @message
        format.js
      else
        format.js
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
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
  
  def cancel
    respond_to do |format|
      format.js {render "create"}
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end
