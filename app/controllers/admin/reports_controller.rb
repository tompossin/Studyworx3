class Admin::ReportsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_school_staff
  
  def index
    @nav_body_content = "admin/reports/navbar"
    @school = School.find(current_user.school)
    @students = @school.students
  end
  
  private
  
  def get_school
    @school = School.find(current_user.school)
  end
  
end
