# === Admin Interface for Schools
# * for non-administrative functions see SchoolsController
class Admin::SchoolsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin, :only => [:index]
  
  # Return all schools newest first
  # * /admin/schools
  def index
    if current_user.user_admin.level == 3
      @schools = School.order("start_date DESC").all
    else
      @schools = current_user.schools.order("start_date DESC").all
    end
  end

  def show
    @school = School.find(params[:id])
  end

  def edit
    @school = School.find(params[:id])   
    @nav_body_content = "admin/assignments/toolbar"
    respond_to do |format|
      if is_my_school?(@school.id)
        format.html 
      else
        format.html {redirect_to :back, alert: "not authorized to edit!"}
      end
    end
  end

  def new
    @school = School.new    
  end
  
  # This will be the call to create a new school from an existing one.
  def from_template
    
  end

  def create
    @school = School.new(params[:school])
    @school.owner_id = current_user.id
    
    respond_to do |format|
      if @school.save
        @school.create_leader(current_user)
        format.html { redirect_to school_path(@school), notice: 'School was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @school = School.find(params[:id])

    respond_to do |format|
      if is_my_school?(@school.id)
        if @school.update_attributes(params[:school])
          format.html { redirect_to school_path(@school), notice: 'School was successfully updated.' }
        else
          format.html { render action: "edit" }
        end
      else
        format.html {redirect_to :back, alert: "You are not authorized to update."}
      end
    end
  end

  def destroy
  end
  
  private

 
end
