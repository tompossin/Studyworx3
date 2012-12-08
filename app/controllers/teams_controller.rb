class TeamsController < ApplicationController
  before_filter :authenticate_user!
  
  # Display all the users current teams
  def index
    @teams_i_own = Team.find_all_by_owner_id(current_user.id)
    @my_teams = current_user.teams
    @schools = School.all
    @nav_body_content = "profiles/teams"
    respond_to do |format|
      format.js
    end
  end
  
  # Show a single teams details
  def show
    
  end
  
  # Load the form for creating a new team.
  def new
    @team = current_user.teams.build()
    @schools = School.all
    respond_to do |format|
      format.js
    end
  end
  
  def create
    
  end
  
  def update
    
  end
  
  # load the page used to add and remove members
  def edit
    @team = Team.find(params[:id])
    @members = @team.users.all
    @users = User.all
    respond_to do |format|
      format.js
    end
  end
  
  # Deletes a team and all members
  def destroy
    
  end
  # Add and member to a team
  def add_member
    
  end
  # Delete a member from a team
  def remove_member
    
  end
  
end
