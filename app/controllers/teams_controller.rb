class TeamsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_schools, except: [:index,:show,:destroy ]
  
  # Display all the users current teams
  def index
    @teams_i_own = Team.find_all_by_owner_id(current_user.id)
    @my_teams = current_user.teams
    respond_to do |format|
      format.html
    end
  end
  
  # Show a single teams details
  def show
    @team = Team.find(params[:id])
    @members = @team.users.all

    respond_to do |format|
      format.js
    end
  end
    
  # load the page used to add and remove members
  def edit
    @team = Team.find(params[:id])
    @members = @team.users.all
    
    if session[:school_id]
      @school = School.find(session[:school_id])
      @users = @school.users
    else
      @users = User.limit(20).all
    end

    respond_to do |format|
      format.js
    end
  end
  
  # Load the form for creating a new team.
  def new
    @team = current_user.teams.build()
    @team.owner_id = current_user.id

    respond_to do |format|
      format.js
    end
  end
  
  def create
    @team = current_user.teams.create(params[:team])
    @members = @team.users.all

    respond_to do |format|
      unless @team.coreteam == "1" and current_user.role > 2
        if @team.save
          format.js
        else
          format.js {render("shared/save_failed")}
        end
      else
        format.js {render "shared/must_be_school_admin"}
      end
    end
  end
  
  def update
    @team = Team.find(params[:id])
    
    respond_to do |format|
      unless params[:team][:coreteam] == "1" and current_user.role > 2
        if @team.update_attributes(params[:team])
          @members = @team.users.all
          format.js 
        else
          format.js {render("shared/save_failure")}
        end
      else
        format.js {render "shared/must_be_school_admin"}
      end
    end
  end
  
  # Deletes a team and all members
  def destroy
    @team = Team.find(params[:id])
    @team.users.clear
    @team.destroy
    @teams_i_own = Team.find_all_by_owner_id(current_user.id)
    @my_teams = current_user.teams

    respond_to do |format|
      if @team.destroy
        format.js { render :index }
      else
        format.js { render "shared/delete_failed" }
      end
    end  
  end
  
  # Shows the profile for a team member or potential team member in the #popup window.
  def show_user
    @user = User.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
  
  # Adds or Removes members from a team
  def memberships
    @team = Team.find(params[:id])
    @members = @team.users.all
    school = School.find(@team.school_id)
    @users = school.users.all

    respond_to do |format|
      format.js
    end
  end
  
  # Add and member to a team
  # Unless this person is already a member
  def add_member
    user = User.find(params[:user_id])
    @team = Team.find(params[:id]) 
    school = School.find(@team.school_id) 
    @users = school.users.all
    
    respond_to do |format|
      if @team.add_member(user)
        @members = @team.users
        format.js {render :memberships }
      else
        format.js {render :duplicate_member }
      end
    end
  end
  
  # Delete a member from a team
  def remove_member
    user = User.find(params[:user_id])
    @team = Team.find(params[:id])
    @team.remove_member(user)
    school = School.find(@team.school_id)
    
    @members = @team.users
    @users = school.users.all
    
    respond_to do |format|
      format.js {render :memberships }
    end
  end
  
  private
  def get_schools
    @schools = School.all
  end
  
end
