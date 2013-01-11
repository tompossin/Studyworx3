class Admin::ScoresheetsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  before_filter :load_school
  before_filter :load_toolbar
  
  def index
    
  end

  def show
  end

  def edit
  end

  def new
  end
  
  private
  
  def load_school
    @school = School.find(current_user.school)
  end
  
  def load_toolbar
    @nav_body_content = "admin/assignments/toolbar"
  end
  
end
