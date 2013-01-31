class Admin::AssignmentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  before_filter :load_toolbar
  before_filter :load_school
  
  # Load the school/assignments page
  def index
    @assignments = @school.assignments.all
    @mods = @assignments.group_by(&:module)

  end
  
  def showmod
    @assignments = @school.assignments.where(:module => params[:mod_id])
    @module = params[:id]
    
  end

  def show
  end

  def edit
    @assignment = Assignment.find(params[:id])
    @tasks = @assignment.tasks.all
    
  end

  def new
    @assignment = Assignment.new
  end
  
  def create
    @assignment = Assignment.new(params[:assignment])
    @assignment.school_id = @school.id
    respond_to do |format|
      if @assignment.save
        format.html { redirect_to admin_assignments_path, notice: 'Assignment was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def update
    @assignment = Assignment.find(params[:id])
    @assignment.update_attributes(params[:assignment])
    respond_to do |format|
      if @assignment.save
        format.html {redirect_to edit_admin_assignment_path(@assignment), notice: 'Assignment was successfully saved.'}
      else
        format.html {redirect_to edit_admin_assignment_path(@assignment), alert: 'Assignment was not saved'}
      end
    end
  end
  
  def destroy
    
  end
  
  private
  
  def load_toolbar
    @nav_body_content = "admin/assignments/toolbar"
  end
  
  def load_school
    @school = School.find(current_user.school)
  end
  
end