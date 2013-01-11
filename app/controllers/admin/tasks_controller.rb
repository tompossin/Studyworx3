class Admin::TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  before_filter :load_assignment
  before_filter :load_toolbar
  before_filter :load_school
  
  # Load the Assignment/tasks page
  def index
    @tasks = @assignment.tasks.all 
  end

  def show
  end

  def edit
    @task = Task.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def new
    @task = @assignment.tasks.new
    respond_to do |format|
      format.js
    end
  end
  
  def create
    @task = @assignment.tasks.new(params[:task])
    respond_to do |format|
      if @task.save
        format.html {redirect_to admin_assignment_tasks_path(@assignment)}
      end
    end
  end
  
  def update
    @task = Task.find(params[:id])
    @task.update_attributes(params[:task])
    respond_to do |format|
      format.html {redirect_to admin_assignment_tasks_path(@assignment)}
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html {redirect_to admin_assignment_tasks_path(@assignment)}
    end
  end
  
  private
  
  # Loads the curent assignment 
  def load_assignment
    @assignment = Assignment.find(params[:assignment_id])
  end
  
  # Loads the default toolbar
  def load_toolbar
    @nav_body_content = "admin/assignments/toolbar"
  end
  
  def load_school
    @school = School.find(current_user.school)
  end

  
end
