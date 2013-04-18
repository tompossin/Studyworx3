class StaffnotesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_school_staff, only: [:update]
  
  
  def update
    @staffnote = Staffnote.find(params[:id])
    
    respond_to do |format|
      if @staffnote.update_attributes(params[:staffnote])
        format.js {render "shared/save_success"}
      else
        format.js {render "shared/save_failed"}
      end
    end
  end
  
  def destroy
    @staffnote = Staffnote.find(params[:id])
    @staffnote_id = @staffnote.id
    @staffnote.destroy
    
    respond_to do |format|
      format.js
    end
  end
end
