# === School Participants Controller
# This is a nested resource under schools.
# It is only manipulated in the context of a school
#
# There are four states for a participant: 
# * no record, (never registered or was deleted(no access to school))
# * accepted == 0(pending registration, no access to school)
# * accepted == 1(dropped but can still access school records) 
# * accepted == 2(accepted, active partcipant)

class ParticipantsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_school

  # GET school:id/participants
  def index
    @participants = @school.participant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @participants }
    end
  end

  # GET school/:id/participants/1
  def show
    @participant = @school.participant.find(params[:participant_id])
    @user = User.find(@participant.id )

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET school/:id/participants/new
  # ==== Loads form for registering a new participant.
  # Should check if the user already has a participant for this school
  def new
    unless current_user.participants.exists?(:school_id => params[:school_id])
      @participant = @school.participants.new
    end

    respond_to do |format|
      if @participant
        format.js 
      else
        format.js {render "exists"}
      end
    end
  end

  # GET school/:id/participants/:id/edit
  # ==== SCHOOL ADMINS ONLY - participant.role < 3
  # This will be called for acceptance/Rejection by leader/assistant
  def edit
    if current_user.is_school_admin?(params[:school_id])
      @participant = @school.participants.find(params[:id])
      @teams = @school.coreteams
    end
    
    respond_to do |format|
      if @participant
        format.js
      else
        format.js {render "shared/save_failed"}
      end
    end
  end

  # POST school/:id/participants
  # ==== Creates a new registration unless one already exists.
  def create
    if params[:participant][:accepted] == "1" and params[:participant][:prereq] == "1"
      unless current_user.participants.exists?(:school_id => params[:school_id])
        @participant = @school.participants.new(params[:participant])
        @participant.user_id = current_user.id
        @participant.accepted = 0
        @participant.save
      end
    end
    
    respond_to do |format|
      if @participant
        Notifier.participant_user(@participant,@school).deliver
        Notifier.participant_admins(@participant,@school).deliver
        format.js { render "register_success" }
      else
        format.js { render "register_failure" }
      end
    end
  end

  # PUT school/:id/participants/:id
  # ==== School Admins Only - participant.role < 3
  # Updates accept/reject
  def update
    @participant = @school.participants.find(params[:id])

    respond_to do |format|
      if @participant.update_attributes(params[:participant])
        @team = Team.find(params[:coreteam])
        @team.add_member(@participant.user)
        format.js
        if @participant.accepted == 2
          Notifier.participant_acceptance(@participant,@school).deliver
        end 
      else
        format.js { render "register_failure" }
      end
    end
  end

  # DELETE school/:id/participants/:id
  # ==== School Admins Only - participant.role < 3
  def destroy
    @participant = @school.participants.find(params[:id])
    @participant.remove_school_teams(current_user.id, @school)
    @participant.destroy

    respond_to do |format|
      Notifier.participant_deleted(@participant,@school).deliver
      format.html { redirect_to admin_tools_personnel_url }
    end
  end
  
  private
  # ==== Loads the current school url params
  def get_school
    @school = School.find_by_id(params[:school_id])
  end
end
