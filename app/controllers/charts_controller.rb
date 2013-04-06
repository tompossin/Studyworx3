class ChartsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_task
 
  # Start page for charting.
  def start  
    if Title.is_started?(@task.id,current_user.id)
      @titles = Title.where("task_id = ? and user_id = ?",@task.id,current_user.id).all
    end
    
    respond_to do |format| 
      format.html 
    end
  end
  
  def autopopulate
    @titles = Title.autopopulate(@assignment,@task,current_user)
    respond_to do |format|
      format.js
    end
  end
  
  # This loads the dialog for inserting new titles
  def new_title
    @title = Title.find(params[:title_id])
    
    respond_to do |format|
      format.js
    end
  end
  
  # This creates the title record of the type that the new_title method calls for
  def create_title
    old_title = Title.find(params[:title_id])
    @title = old_title.insert_title(params[:title_type].to_i)
    
    respond_to do |format|
      if @title
        format.js
      else
        format.js {render "insert_failed"}
      end
    end
  end
  
  # This saves a title after editing
  def save
    @title = Title.find(params[:title_id])
    new_title = @title.clean_input(params[:title])
    @title.title = new_title
    
    respond_to do |format|
      if @title.save
        format.js 
      else
        format.js {render "shared/save_failed"}
      end
    end
  end
  
  # Deletes a single title when called.
  def delete_title
    @title = Title.find(params[:title_id])
    position = @title.position
    @title.destroy
    Title.reorder_after_delete(@task.id,current_user.id,position)
    
    respond_to do |format|
      format.js
    end
  end
  
  # This destroys all titles and all dependencies - (slow)
  def destroy_all
    Title.where("task_id = ? and user_id = ?",@task.id,current_user.id).destroy_all
    
    respond_to do |format|
      format.js
    end
  end
  
  private
  
  # Get assignment and duetime for the current selection
  def get_task
    @task = Task.find(params[:task_id])
    @assignment = Assignment.find(@task.assignment_id)
    @duetime = @assignment.duetime(current_user)
  end
  
  
  
end
