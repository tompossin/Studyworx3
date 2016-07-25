class Admin::DuedatesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_school_admin
  before_filter :get_school

  # admin/assignment/duedates
  #
  # Lists all assignment/duetimes in the current module.
  def index
    @teams = @school.teams.where(coreteam: true)
    # the code below no longer works with mysql 5.7
    #@modules = @school.assignments.group(:module)
    @modules = @school.assignments.where("module > ?",0).select(:module).group(:module)
    @nav_body_content = "admin/assignments/toolbar"

  end

  # This lists the assignments by Module, and Team
  # A form sends the params for this page.
  # The path is:
  #  [GET] admin_duedates_list_path returns params[:team] and params[:module]
  def list
    unless params[:team] == "" or params[:module] == ""
      @team = Team.find(params[:team])
      @duedates = Team.find_or_create_team_duedates_by_module(@school,@team,params[:module])
      @nav_body_content = "admin/assignments/toolbar"
      @mod_id = params[:module]
    else
      blank = true
    end
    respond_to do |format|
      unless blank
        format.html
      else
        format.html {redirect_to admin_duedates_path, alert: "Please select both a team and a module." }
      end
    end
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
