class GradesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_school_staff, except: [:index, :show]
  before_filter :get_school
  
  def index
    @grades = @school.grades.all

    respond_to do |format|
      format.html 
    end
  end

  # GET /grades/1
  def show
    @grade = Grade.find(params[:id])

    respond_to do |format|
      format.html 
    end
  end

  # GET /grades/new
  def new
    @grade = Grade.new

    respond_to do |format|
      format.html 
    end
  end

  # GET /grades/1/edit
  def edit
    @grade = Grade.find(params[:id])
  end

  # POST /grades
  def create
    @grade = Grade.new(params[:grade])

    respond_to do |format|
      if @grade.save
        format.html { redirect_to @grade, notice: 'Grade was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # Update the grade record with the new staff and status info.
  def update
    @grade = Grade.find(params[:id])

    respond_to do |format|
      unless params[:grade][:staff_id] == ""
        if @grade.update_attributes(params[:grade])
          @checker = User.find(@grade.staff_id)
          format.js 
        else
          format.js { render "shared/save_failed"}
        end
      else
        format.js { render "need_staff" }
      end
    end
  end
  
  def hand_in
    @grade = Grade.hand_in_to_staff(@school.id, params[:assignment_id], current_user.id)
    
    respond_to do |format|
      format.js 
    end
  end
  
  def load_team
    @students = User.includes(:teams).where("teams.id = ?",params[:team]).all
    
    respond_to do |format|
      format.js 
    end
  end
  
  def load_module
    @assignments = Assignment.where("module = ?",params[:module]).all
    
    respond_to do |format|
      format.js 
    end
  end
  
  def collect
    @teams = @school.teams.all
    @modules = @school.assignments.pluck(:module).uniq
    
    respond_to do |format|
      format.html 
    end
  end
  
  # Batch create grading records for the current_user (staff)
  def collect_save
    staff_id = current_user.id
    
    respond_to do |format|
      unless params[:assignment_ids].nil? or params[:user_ids].nil?
        Grade.assign_students_and_assignments_to_staff(@school.id,params[:assignment_ids],params[:user_ids],staff_id)
        format.html {redirect_to :back}
      else
        format.html {redirect_to :back, notice: 'You must select at least one student and one assignment.'}
      end
    end
  end

  # DELETE /grades/1
  def destroy
    @grade = Grade.find(params[:id])
    @grade.destroy

    respond_to do |format|
      format.html { redirect_to grades_url }
    end
  end
  
  private
  
  def get_school
    @school = School.find(current_user.school)
  end
end
