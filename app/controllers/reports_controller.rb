class ReportsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_school_staff
  
  def index
    
  end
  
  private
  
  def get_school
    @school = School.find(current_user.school)
  end
  
end
