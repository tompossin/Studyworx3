class Admin::ReportsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_school_staff
  before_filter :get_school
  before_filter :get_modules
  
  def index
    @nav_body_content = "admin/reports/navbar"
    #@school = School.find(current_user.school)
    @students = @school.students
  end
  
  def pending_grading
    @nav_body_content = "admin/reports/navbar"
    @pending = Grades.where("school_id = ? and ")
  end
  
  def by_module
    @nav_body_content = "admin/reports/navbar"
    @mod = params[:mod]
    @students = @school.students
  end
  
  private
  
  def get_school
    @school = School.find(current_user.school)
  end
  
  def get_modules
    @modules = Assignment.where("school_id=? and module > 0",current_user.school).group('module')
    
  end
  
end
