class TurninsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_school


  # Finds or creates a new turnin record
  def new
    @turnin = Turnin.find_or_create_by_user_id(current_user.id)
    @turnin.assignment_id = params[:assignment_id]
    @turnin.save

    respond_to do |format|
      format.js
    end
  end

  def update
    @turnin = Turnin.find(params[:id])

    respond_to do |format|
      if @turnin.update_attributes(params[:turnin])
        unless @turnin.staff_id.nil?
          @checker = User.find(@turnin.staff_id)
          format.js
        else
          format.js { render "need_staff"}
        end
      else
        format.js { render "shared/save_failed"}
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
