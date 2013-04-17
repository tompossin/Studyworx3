class StaffnotesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_school_staff, only: [:edit, :new, :create, :update]
  
  def index
    
  end

  def show
    
  end

  def new
    
  end

  def edit
    
  end
  
  def create
    
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
    
  end
end