class ChartsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_task
 
  # Start page for charting.
  def start
    @titles = Title.find_or_autopopulate(@assignment,@task,current_user)
    
  end
  
  private
  
  # Get assignment and duetime for the current selection
  def get_task
    @task = Task.find(params[:task_id])
    @assignment = Assignment.find(@task.assignment_id)
    @duetime = @assignment.duetime(current_user)
  end
  
  
  
end
