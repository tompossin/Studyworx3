class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_task
  
  def index
    @comments = @task.comments.roots  
  end
  
  # Start a new root comment (parent)
  def new
    @comment = @task.comments.new(user_id: current_user.id)
    respond_to do |format|
      format.js
    end
  end
  
  # Start a new child comment
  def new_child
    @parent = Comment.find(params[:id])
    @comment = @parent.children.new(user_id: current_user.id, task_id: @task.id)
    respond_to do |format|
      format.js
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
  
  # Create a new
  def create
    @comment = Comment.create(params[:comment])
    respond_to do |format|
        format.html {redirect_to task_comments_path(@task) }
    end
  end
  
  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.js {render "comment"}
      else
        format.js {render "shared/save_failed"}
      end
    end
  end
  
  def cancel
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
  
  def destroy
    
  end
  
  def staffnote
    @comment = Comment.find(params[:id])
    @staffnote = @comment.staffnotes.first
    unless @staffnote
      @staffnote = @comment.staffnotes.create(user_id: @comment.user_id, assignment_id: @task.assignment_id)
    end
    respond_to do |format|
      format.js {render "documents/staffnote"}
    end
  end
  
  # update staffnote only (by the staff)
  def update_staffnote
    @comment = Comment.find(params[:id])
    @comment.staff_note = params[:comment][:staff_note]
    respond_to do |format|
      if current_user.role < 4
        if @comment.save
          format.js {render "shared/save_success"}
        else
          format.js {render "shared/save_failed"}
        end
      else
        format.js {render "shared/save_failed"}
      end
    end
  end
  
  private
  
  def get_task
    @task = Task.find(params[:task_id])
  end
end
