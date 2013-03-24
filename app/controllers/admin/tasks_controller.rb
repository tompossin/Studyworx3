class Admin::TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_school_admin, except: [:show_help]
  before_filter :load_assignment
  before_filter :load_toolbar
  before_filter :load_school
  
  # Load the Assignment/tasks page
  def index
    @tasks = @assignment.tasks.all 
  end

  def show_help
    @task = Task.find(params[:task_id])
    respond_to do |format|
      format.js
    end
  end
  
  def sort
    @tasks = @assignment.tasks.all
    @tasks.each do |t|
      t.position = params[:task].index(t.id.to_s) + 1
      t.save
    end
    respond_to do |format|
      format.js {render 'shared/save_success'}
    end
  end

  def edit
    @task = Task.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    @task = @assignment.tasks.new
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @task = @assignment.tasks.new(params[:task])
    respond_to do |format|
      if @task.save
        format.html {redirect_to admin_assignment_tasks_path(@assignment), notice: 'Task has been created'}
      else
        format.html {render :new}
      end
    end
  end
  
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html {redirect_to :back, notice: 'Task has been saved.'}
      else
        format.html { render :edit }
      end
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
