# === Admin Interface for Schools
# path = /admin/schools/action
class Admin::SchoolsController < ApplicationController
  before_filter :authenticate_user!
  
  # Return all schools newest first
  # /admin/schools
  def index
    if current_user.is_school_admin
      @schools = School.order("start_date DESC").all
    else
      render :template => "shared/not_authorized"
    end
    
  end

  def show
    @school = School.find(params[:id])
  end

  def edit
    @school = School.find(params[:id])   
  end

  def new
    @school = School.new    
  end

  def create
    @school = School.new(params[:school])

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
end
