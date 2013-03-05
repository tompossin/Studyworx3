# === Admin Interface for Schools
# * for non-administrative functions see SchoolsController
class Admin::SchoolsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_superadmin, :only => [:index]
  
  # Return all schools newest first
  # * /admin/schools
  def index
      @schools = School.order("start_date DESC").all
  end

  def show
    @school = School.find(params[:id])
  end

  def edit
    @school = School.find(params[:id])   
    @nav_body_content = "admin/assignments/toolbar"
  end

  def new
    @school = School.new    
  end

  def create
    if is_my_school(params[:school][:id])
      @school = School.new(params[:school])
    end
      
    

    respond_to do |format|
      if @school.save
        format.html { redirect_to school_path(@school), notice: 'School was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @school = School.find(params[:id])

    respond_to do |format|
      if @school.update_attributes(params[:school])
        format.html { redirect_to school_path(@school), notice: 'School was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
  end
  
  private

 
end
