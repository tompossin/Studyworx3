class StaffnotesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_school_staff, only: [:update]
  
  
  def document
    @document = Document.find(params[:document_id])
    respond_to do |format|
      format.js
    end
  end
  
  def title
    @title = Title.find(params[:title_id])
    respond_to do |format|
      format.js
    end
  end
  
  def ppoint
    @ppoint = Ppoint.find(params[:ppoint_id])
    respond_to do |format|
      format.js
    end
  end
  
  def charttext
    @charttext = Charttext.find(params[:charttext_id])
    respond_to do |format|
      format.js
    end
  end
  
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
