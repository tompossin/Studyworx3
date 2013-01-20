class Admin::ScoresheetsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  before_filter :load_school
  before_filter :load_toolbar
  
  def index
    @scoresheets = @school.scoresheets.all
  end

  def show
    @scoresheet = @school.scoresheets.find(params[:id])
  end

  def edit
    @scoresheet = Scoresheet.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def new
    @scoresheet = @school.scoresheets.new
    respond_to do |format|
      format.js
    end
  end
  
  def create
    @scoresheet = Scoresheet.new(params[:scoresheet])
    @scoresheet.school_id = @school.id
    @scoresheet.save
    respond_to do |format|
      format.html {redirect_to admin_school_scoresheets_path(@school)}
    end
  end
  
  def update
    @scoresheet = Scoresheet.find(params[:id])
    @scoresheet.update_attributes(params[:scoresheet])
    @scoresheet.save
    respond_to do |format|
      format.html {redirect_to admin_school_scoresheets_path(@school)}
    end
  end
  
  def destroy
    @scoresheet = Scoresheet.find(params[:id])
    @scoresheet.destroy
    respond_to do |format|
      format.html {redirect_to admin_school_scoresheets_path(@school)}
    end
  end
  
  private
  
  def load_school
    @school = School.find(current_user.school)
  end
  
  def load_toolbar
    @nav_body_content = "admin/assignments/toolbar"
  end
  
end
