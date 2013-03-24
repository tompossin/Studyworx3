# === Schools Controller (Public Interface)
# This controller handles non-administrative school methods.
# * For admin functions use Admin::SchoolsController
class SchoolsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_student, only: [:homeroom]
  
  # GET /schools
  def index
    @school = School.find_or_initialize_by_id(current_user.school)
    load_school_vars
    check_for_pending_registrations?
    
    respond_to do |format|
      if current_user.school < 1
        format.html # index.html.erb
      else
        unless current_user.staff?
          @assignments = @school.current_assignments(current_user)
        else
          @teams = @school.teams.where('coreteam = ?',true)
        end
        format.html { render :homeroom }
      end
    end
  end

  # GET /schools/1
  def show
    @school = School.find(params[:id])
    load_school_vars

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @school }
    end
  end
  
  # This is the default page for a participant.
  def homeroom
    @school = School.find(current_user.school)
    check_for_pending_registrations?
    load_school_vars
    unless current_user.staff?
      @assignments = @school.current_assignments(current_user)
    else
      @teams = @school.teams.where('coreteam = ?',true)
    end
    
    respond_to do |format|
      format.html 
    end
  end
  
  # Load assignments according to selected coreteam
  def load_team_assignments
    @school = School.find(current_user.school)
    @team = Team.find(params[:team])
    @assignments = @school.current_team_assignments(@team.id)
    
    respond_to do |format|
      format.js 
    end
  end
  
  # Sets the users current school
  def set_current
      if current_user.set_school(params[:id])
        @school = School.find(current_user.school)
        respond_to do |format|
            flash[:notice] = "Changed default school to #{@school.name}"
            format.html {redirect_to homeroom_school_path }
        end
      else 
        flash[:alert] = "You are not a student in this school"
        redirect_to root_path  
      end   
  end
  
  private
  # This loads standard school variables to keep things DRY
  def load_school_vars
    @schools = School.all_active
    @enrollments = current_user.participants.all
    @nav_body_content = "schools/schools"
  end
  
  # This checks for pending registrations
  def check_for_pending_registrations?
    if current_user.leader?
      @registrations = @school.participants.pending
      if @registrations.empty?
        @registrations = false
      end
    else
      @registrations = false
    end
  end
  
  
end
