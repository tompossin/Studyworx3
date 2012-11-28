  # This is just a controller - it will be calling
  # pages that edit the users table.
  # 
  # This will be the main controller for user info updates,etc.
  #
  # This will give an understandable url and will
  # make it easier to avoid route conflicts with
  # devise.
class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin, :only=>[:reviewboard, :update_reviewboard, :setstock]

  
  # This is the main "profile page" or "Users Home page"
  def show
    @participants = Participant.includes(:school).where(user_id: current_user.id).all
    @images = Mercury::Image.find_all_by_user_id(current_user.id)
    @stockimages = Mercury::Image.find_all_by_user_id(0)
    @nav_body_content = "schools/schools"
  end
  
  # This edits the users personal data
  def saveprofile
    user = User.find(current_user.id)
    user.bio = params[:content][:bio][:value]
    user.phone = params[:content][:phone][:value]
    user.address = params[:content][:address][:value]
    user.save!
    render text: ""
  end
  
  # Team creation and management methods. 
  #
  # I did not put these methods in their own controller since I see this as an
  # extention of the profiles methods. If this becomes too cumbersome by the 
  # time I add messaging and email I may have to break it out of this controller.
  #
  # This call loads current teams the user owns or is part of

  def teams
    @teams_i_own = Team.find_all_by_owner_id(current_user.id)
    @my_teams = current_user.teams
    @schools = School.all
  end
  # Loads a form for team creation
  def new_team
    @team = current_user.teams.build()
    @schools = School.all
  end
  # Saves a new Team which is actually a user object with the user.team = true set
  def save_team
    @team = current_user.teams.create(owner_id: params[:owner_id])
    @team.name = params[:name]
    @team.description = params[:description]
    @team.school_id = params[:school_id]
    @team.save
    flash[:notice] = "Team Saved"
    @schools = School.all
    render :new_team
  end
  # This page creates a group of user.id's to associate with a team user.id
  def add_members
    
  end
  # This saves a group of members to the members table via AJAX
  def save_member
    
  end
  
  # This can only be edited by an admin or better.
  # This retrieves a users review board status
  def reviewboard
    @user = User.find(params[:profile_id])   
  end
  # must be admin or better
  # This edits a users reviewboard status
  def update_reviewboard
    user = User.find(params[:id])
    user.reviewboard = params[:reviewboard]
    user.save
    flash[:alert] = "The review board status has been updated"
    redirect_to user_admins_path
  end
  
  # This sets the avatar file for the user
  def setavatar
    user = User.find(current_user.id)
    user.avatar = params[:profile_id]
    user.save
    a = Mercury::Image.find(user.avatar)
    session[:avatar] = user.avatar
    session[:avatar_image] = a.image_file_name
    redirect_to profile_path(current_user.id)
  end
  
  # This sets the wallpaper of a user.
  def setwallpaper
    user = User.find(current_user.id)
    user.wallpaper = params[:profile_id]
    user.save
    w = Mercury::Image.find(user.wallpaper)
    session[:wallpaper] = user.wallpaper
    session[:wallpaper_image] = w.image_file_name
    redirect_to profile_path(current_user.id)
  end
  # This sets the theme of a user.
  def settheme
    
  end
  # This sets an image as a stock image - must be an admin
  def setstock
    stock = Mercury::Image.find(params[:profile_id])
    stock.user_id = 0
    stock.save
    redirect_to profile_path(current_user.id)
  end
  # Loads or creates a reminder for editing via AJAX
  def load_reminder
    @note = Note.find_by_user_id(current_user.id)
    respond_to do |format|
      if @note
        format.js
      else
        @note = Note.new
        @note.user_id = current_user.id
        @note.reminder = "Click the icon above to add a reminder..."
        @note.save
        format.js
      end
    end   
  end

  # Saves updated reminder and loads via AJAX
  def save_reminder
    @note = Note.find_by_user_id(current_user.id)
    respond_to do |format|
      @note.reminder = params[:reminder]
      @note.save
      format.js
    end
  end
  
  # There is no need for a create method since
  # devise creates the user records.

  def update
    if is_owner(params[:user_id])
      # need some action here.
      flash[:alert] = "Your profile has been updated!"
    else
      redirect_to root_path, alert: "You can only edit your own profile!"
    end
    
  end
  
  protected
  
  def get_participants
    
  end
  
end

