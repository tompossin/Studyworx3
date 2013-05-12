class Admin::DuedatesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_school_admin
  before_filter :get_school
  
  # admin/assignment/duedates
  #
  # Lists all assignment/duetimes in the current module.
  def index
    @teams = @school.teams.where(coreteam: true)
    @modules = @school.assignments.group(:module)
    @nav_body_content = "admin/assignments/toolbar"
    
  end
  
  # This lists the assignments by Module, and Team
  # A form sends the params for this page.
  # The path is:
  #  [POST] admin_duedates_list_path returns params[:team] and params[:module]
  def list
    @team = Team.find(params[:team])
    @duedates = Team.find_or_create_team_duedates_by_module(@school,@team,params[:module])
    @nav_body_content = "admin/assignments/toolbar"
    @mod_id = params[:module]
    
  end

  def edit
    @duedate = Duedate.find(params[:id])
    
    respond_to do |format|
      format.js
    end
  end

  def update
    @duedate = Duedate.find(params[:id])
    respond_to do |format|
      if @duedate.update_attributes(params[:duedate])
        format.js
      else
        format.js {render "shared/save_failed"}
      end
    end
  end
  
  private
  
  def get_school
    @school = School.find(current_user.school)
  end
  
end
