  # This is just a controller - it will be calling
  # pages that edit the users table and the teams table.
  # 
  # This will be the main controller for user info updates,etc.
  # Most of these actions will render to the nav_bar via AJAX
  #
  # This will give an understandable url and will
  # make it easier to avoid route conflicts with
  # devise.
class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin, :only=>[:reviewboard, :update_reviewboard]

  
  # This is the users "Public Profile page"
  def show
      @user = User.find(params[:id])
      respond_to do |format|
        format.js
      end
  end
  
  # This is the users private profile page
  # TODO get paperclip working on the User model
  def edit
    @user = current_user
    @my_schools = @user.schools.where(active: true)
    @schools = School.all_active
    @nav_body_content = "schools/schools"
  end
  
  # ADMIN METHODS
  #
  # This can only be edited by an admin or better.
  # This retrieves a users review board status
  def reviewboard
    @user = User.find(params[:profile_id])   
  end
  # must be admin or better
  # This edits a users reviewboard status
  def reviewboard_update
    user = User.find(params[:id])
    user.reviewboard = params[:reviewboard]
    user.save
    flash[:alert] = "The review board status has been updated"
    redirect_to user_admins_path
  end
  
  # PERSONAL PREFERENCE MEHTODS
  #
  # This sets the theme of a user.
  def settheme
    
  end
  
  # NOTE TO SELF METHODS
  # Loads or creates a reminder for editing via AJAX
  def reminder_load
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
  def reminder_save
    @note = Note.find_by_user_id(current_user.id)
    respond_to do |format|
      @note.reminder = params[:reminder]
      @note.save
      format.js
    end
  end
  
  # UPDATE PROFILE
  #
  # This edits the users personal data
  # 
  def update
    if params[:id] == current_user.id.to_s
      @user = User.find(params[:id])
      @user.update_attributes!(params[:user])
    end
    redirect_to edit_profile_path(current_user.id)
  end
  
  protected
  

  
end

