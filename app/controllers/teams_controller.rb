class TeamsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_schools, except: [:index,:show,:destroy ]
  
  # Display all the users current teams
  def index
    @teams_i_own = Team.find_all_by_owner_id(current_user.id)
    @my_teams = current_user.teams
    respond_to do |format|
      format.js
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
    @members = @team.users

    respond_to do |format|
      if @team.save
        format.js
      else
        format.js {render("shared/save_failed")}
      end
    end
  end
  
  def update
    @team = Team.find(params[:id])
    @members = @team.users.all
    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.js
      else
        format.js {render("shared/save_failure")}
      end
    end
  end
  
  # Deletes a team and all members
  def destroy
    @team = Team.find(params[:id])
    @team.users.clear
    @team.destroy

    respond_to do |format|
      if @team.destroy
        format.js 
      else
        format.js { render "shared/delete_failed" }
      end
    end  
  end
  
  # Membership editing page
  # TODO need a search field on this page when people try to add users
  # that are not in their school.
  def memberships
    @team = Team.find(params[:id])
    @members = @team.users.all
    
    if session[:school_id]
      @school = School.find(session[:school_id])
      @users = @school.users.order("lastname ASC")
    else
      @users = User.limit(20).all
    end

    respond_to do |format|
      format.js
    end
  end
  
  # Add and member to a team
  def add_member
    @team = Team.find(params[:id])
    @user = User.find(params[:user_id])
    @team.users<< @user
    @members = @team.users
    @users = User.all
    
    respond_to do |format|
      format.js {render :memberships }
    end
  end
  
  # Delete a member from a team
  def remove_member
    @team = Team.find(params[:id])
    @user = User.find(params[:user_id])
    @team.users.delete(@user)
    @members = @team.users
    @users = User.all
    
    respond_to do |format|
      format.js {render :memberships }
    end
  end
  
  private
  def get_schools
    @schools = School.all
  end
  
end
