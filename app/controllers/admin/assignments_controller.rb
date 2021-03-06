class Admin::AssignmentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_school_admin, except: [:show_help]
  before_filter :load_toolbar
  before_filter :load_school
  
  # Load the school/assignments page
  def index
    @assignments = @school.assignments.all
    @mods = @school.assignments.group_by(&:module)

  end
  
  def showmod
    @assignments = @school.assignments.where(:module => params[:mod_id]).order('position ASC')
    @module = params[:mod_id]
    
  end
  
  def clone
    clone = Assignment.find(params[:assignment_id])
    @assignment = Assignment.create(school_id: clone.school_id, name: "add name",book_id: clone.book_id, module: clone.module, scoresheet_id: clone.scoresheet_id, weight: clone.weight, resources: clone.resources, instructions: clone.instructions)
    @assignment.clone_tasks(clone)
    respond_to do |format|
      format.html { redirect_to edit_admin_assignment_url(@assignment) }
    end
  end
  
  def show_help
    @assignment = Assignment.find(params[:assignment_id])
    respond_to do |format|
      format.js
    end
  end
  
  # admin/assignments/sort
  # This is called via ajax after a drag&drop sort.
  def sort
    @assignments = @school.assignments.where(:module => params[:mod_id])
    @assignments.each do |a|
      a.position = params['assignment'].index(a.id.to_s) + 1
      a.save
    end 
    respond_to do |format|
      format.js {render 'shared/save_success'}
    end
  end

  def edit
    @assignment = Assignment.find(params[:id])
    @module = @assignment.module
    @tasks = @assignment.tasks.all
    
  end

  def new
    unless params[:mod_id]
      @assignment = Assignment.new
    else
      @module = params[:mod_id]
      @assignment = Assignment.new(module: params[:mod_id])
    end
  end
  
  def create
    @assignment = Assignment.new(params[:assignment])
    @assignment.school_id = @school.id
    respond_to do |format|
      if @assignment.save
        format.html { redirect_to showmod_admin_assignments_path(:mod_id => @assignment.module), notice: 'Assignment was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def update
    @assignment = Assignment.find(params[:id])
    @assignment.update_attributes(params[:assignment])
    @module = @assignment.module
    respond_to do |format|
      if @assignment.save
        format.html {redirect_to edit_admin_assignment_path(@assignment), notice: 'Assignment was successfully saved.'}
      else
        format.html {redirect_to edit_admin_assignment_path(@assignment), alert: 'Assignment was not saved'}
      end
    end
  end
  
  def destroy
    @assignment = Assignment.find(params[:id])
    @mod = @assignment.module
    
    respond_to do |format|
      if @assignment.destroy
        format.html {redirect_to showmod_admin_assignments_path(mod_id: @mod), notice: 'Assignment was Deleted.'}
      else
        format.html {redirect_to showmod_admin_assingments_path(mod_id: @mod), alert: "Failed to delete assignment."}
      end
    end
  end
  
  private
  
  def load_toolbar
    @nav_body_content = "admin/assignments/toolbar"
  end
  
  def load_school
    @school = School.find(current_user.school)
  end
  
end
