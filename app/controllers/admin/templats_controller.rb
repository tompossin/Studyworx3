class Admin::TemplatsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_school_admin
  before_filter :load_toolbar
  before_filter :load_school
  
  def index
    @templats = @school.templats.all
  end

  def show
    @templat = @school.templats.find(params[:id])
    
    respond_to do |format|
      format.js
    end
  end

  def edit
    @templat = @school.templats.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    @templat = @school.templats.create(name: "Add Name...",content: "Add Content here...")
    respond_to do |format|
      format.html
    end
  end
  
  def update
    @templat = Templat.find(params[:id])
    
    respond_to do |format|
      if @templat.update_attributes(params[:templat])
        unless params[:autopreview]
          format.js { render "shared/save_success" }
        else
          @autopreview = @templat
          format.js { render "shared/autopreview" }
        end
      else
        format.js {render "shared/save_failed"}
      end
      
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
