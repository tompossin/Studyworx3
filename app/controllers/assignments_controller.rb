class AssignmentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_school
  
  # Loads Assignment help
  def help
		@assignment = Assignment.find(params[:assignment_id])
		
		respond_to do |format|
			format.js 
		end
  end

  # This is the Assignment home page
  def show  
    @assignment = @school.assignments.find(params[:id])
    turnin = @assignment.turnins.where("user_id = ?",current_user.id).first
    @checker = User.find(turnin.staff_id) if turnin
    respond_to do |format|
      format.html 
    end
  end
  
  # This calculates the time remaining to complete an assignment
  def time_remaining
    coreteam = current_user.coreteam
    
    respond_to do |format|
      if coreteam
        @duedate = Duedate.where("assignment_id = ? and team_id = ?",params[:assignment_id], coreteam.id).first
        format.js
      else
        format.js {render "shared/no_coreteam"}
      end
    end
  end
  
  private
  
  def load_school
    @school = School.find(params[:school_id])
  end
  
end
