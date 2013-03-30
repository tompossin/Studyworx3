class GradesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_school_staff, only: [:finish, :finish_grading, :grades, :office, :collect, :collect_save]
  before_filter :get_school
  
  # This is the main Student grade page.
  def index
    @grades = current_user.grades.all

    respond_to do |format|
      format.html 
    end
  end
  
  # This is the staff grade entry page
  def grades
    @user = User.find(params[:user_id])
    @grades = @user.grades.all
    
    respond_to do |format|
      format.js
    end
  end
  
  # Finish a students grade record
  def finish_grading
    @grade = Grade.find(params[:grade_id])
    @grades = Grade.includes(:assignment).where("user_id = ?",@grade.user_id).order("updated_at DESC").limit(10)
    @duetime = @grade.duetime
    
    respond_to do |format|
      format.js
    end
  end
  
  def finish
    @grade = Grade.find(params[:grade_id])
    
    
    respond_to do |format|
      format.js
    end
  end

  # This zooms in on individual grades for assignments.
  def show
    @grade = Grade.find(params[:id])

    respond_to do |format|
      format.html 
    end
  end
  
  # This is the grading office page. The homepage for staff grading.
  def office
    @pending = Grade.includes(:assignment).where("grades.staff_id = ? and returned = ? and (grades.viewable = ? or grades.done = ?)",current_user.id,false,true,true).all
    
    respond_to do |format|
      format.html 
      format.js 
    end
  end
  
  # This loads a rendered non-editable version of the document for grading.
  # It looks at task_type and loads the appropriate document/chart/discussion
  # It will also load grading tools if the user is staff or higher.
  def grading_view
    @task = Task.find(params[:task_id])
    @user_id = params[:user_id]
    
    respond_to do |format|
      if @task.task_type == 1
        @document = Document.where("user_id = ? and task_id = ?",params[:user_id],@task.id).first
        @partial_file = select_partial(@task.task_type)
        if current_user.staff?
          @grade = Grade.where("user_id = ? and assignment_id = ?",params[:user_id],@task.assignment_id).first if current_user.staff?         
        end
        format.js 
      elsif @task.task_type == 2
        format.js {render "shared/selection_not_known"}
      elsif @task.task_type == 3
        format.js {render "shared/selection_not_known"}
      else
        format.js {render "shared/selection_not_known"}
      end
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
  # If you want to just save a grade record with only a success reponse use a hidden field called save_only.
  # Not sure if this is very smart but makes the forms easier and fewer routes to maintain.
  def update
    @grade = Grade.find(params[:id])

    respond_to do |format|
      if params[:save_only] # normal save (expects a save_only field)
        if @grade.update_attributes(params[:grade])
          format.js {render "shared/save_success"}
        else
          format.js {render "shared/save_failed"}
        end
      else # save the student turnin form making sure they choose a staff person.
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
  
  def load_tasks
    @assignment = Assignment.find(params[:assignment_id])
    @grade = Grade.where("user_id = ? and assignment_id = ?",params[:user_id], params[:assignment_id]).first
    @user = User.find(params[:user_id])
    @tasks = @assignment.tasks.all
    
    respond_to do |format|
      format.js 
    end
  end
  
  def collect
    @teams = @school.coreteams
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
  
  # Select the file name for the correct partial
  def select_partial(task_type)
    if task_type == 1
      par =  "grades/partials/gv_document"
    elsif task_type == 2
      par = "grades/partials/gv_chart"
    elsif task_type == 3
      par =  "grades/partials/gv_discussion"
    else
      par = false
    end
    return par
  end
  
  
end

