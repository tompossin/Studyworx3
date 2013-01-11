class Admin::TemplatsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  before_filter :load_toolbar
  before_filter :load_school
  
  def index
    @templats = @school.templats.all
  end

  def show
  end

  def edit
    @templat = @school.templats.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def new
    @templat = @school.templats.new
    respond_to do |format|
      format.js
    end
  end
  
  def create
    @templat = @school.templats.new(params[:templat])
    respond_to do |format|
      if @templat.save
        format.html {redirect_to admin_school_templats_path(@school)}
      end
    end
  end
  
  def update
    @templat = Templat.find(params[:id])
    @templat.update_attributes(params[:templat])
    respond_to do |format|
      format.html {redirect_to admin_school_templats_path(@school)}
    end
  end
  
  def destroy
    @templat = Templat.find(params[:id])
    @templat.destroy
    respond_to do |format|
      format.html {redirect_to admin_school_templats_path(@school)}
    end
  end
  
  private
  
  # Loads the default toolbar
  def load_toolbar
    @nav_body_content = "admin/assignments/toolbar"
  end
  
  def load_school
    @school = School.find(current_user.school)
  end
  
end
