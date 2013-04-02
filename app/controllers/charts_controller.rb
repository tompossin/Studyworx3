class ChartsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_task
 
  # Start page for charting.
  def start
    @titles = Title.find_or_autopopulate(@assignment,@task,current_user)
    
  end
  
  # This loads the dialog for inserting new titles
  def new_title
    @title = Title.find(params[:title_id])
    
    respond_to do |format|
      format.js
    end
  end
  
  # This creates the title record that new_title defines
  def create_title
    old_title = Title.find(params[:title_id])
    @title = old_title.insert_title(params[:title_type].to_i)
    
    respond_to do |format|
      format.js
    end
  end
  
  # This save titles after editing
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
  
  private
  
  # Get assignment and duetime for the current selection
  def get_task
    @task = Task.find(params[:task_id])
    @assignment = Assignment.find(@task.assignment_id)
    @duetime = @assignment.duetime(current_user)
  end
  
  
  
end
