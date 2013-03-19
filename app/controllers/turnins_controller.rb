class TurninsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_school


  # Finds or creates a new turnin record for a student
  # Incoming params :assignment_id user_id = current_user.id in this case.
  def hand_in
    @turnin = Turnin.find_or_create_by_student(@school.id,current_user.id,params[:assignment_id])

    respond_to do |format|
      format.js
    end
  end
  
  # finds or creates a new turnin record for a staff
  # TODO build the model and view for this.
  # * This will be some sort of student/assignment selector
  # * Possibly built around teams if it does not get too crazy.
  #     route: collect/:student_id/assignment/:assignment_id 
  #     path: collect_path(student_id: assignment.user_id,assignment.id)
  #     Incoming params :user_id(student), :assignment_id, staff_id = current_user.id in this case.
  def collect
    
  end

  def update
    @turnin = Turnin.find(params[:id])

    respond_to do |format|
      unless params[:turnin][:staff_id] == ""
        @checker = User.find(params[:turnin][:staff_id])
        if @turnin.update_attributes(params[:turnin])
          format.js
        else
          format.js { render "shared/save_failed"}
        end
      else
        format.js { render "need_staff"}
      end
    end
  end

  # DELETE 
  def destroy
    @turnin = Turnin.find(params[:id])
    @turnin.destroy

    respond_to do |format|
      format.html { redirect_to turnins_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def get_school
    @school = School.find(current_user.school)
  end
  
end
