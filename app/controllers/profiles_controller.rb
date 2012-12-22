  # This is just a controller - it will be calling
  # pages that edit the users table and the teams table.
  # 
  # This will be the main controller for user info updates,etc.
  # Most of these actions will render to the nav_bar via AJAX
  # === Profiles Controller
  # This controller will give an understandable url and will
  # make it easier to avoid route conflicts with devise.
  
class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin, :only=>[:reviewboard, :update_reviewboard]

  
  # This is the users "Public Profile page"
  # This can be called by anyone anytime so there is no
  # find_or_create_by_* here. I have put a lot of safeguards
  # in the _show partial to keeps from kicking errors for non-existent
  # notes in the associated record.
  def show
      @user = User.find_by_id(params[:id])
      respond_to do |format|
        format.js
      end
  end
  
  # This is the users private profile page
  # If they have not created an associated notes record
  # This will create one for them.
  def edit
    @user = current_user
    @user.note = Note.find_or_create_by_user_id(@user.id)
    @schools = School.all_active
    @my_schools = current_user.schools.where(active: true)
    @nav_body_content = "schools/schools"
  end
  
  # ADMIN METHODS
  #
  # This can only be edited by an admin or better.
  # This retrieves a users review board status
  def reviewboard
    @user = User.find(params[:id])   
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
  def reminder_show
    respond_to do |format|
      format.js {render template: "profiles/reminder_save"}
    end
  end
  
  def reminder_load
    @note = Note.find_by_user_id(current_user.id)
    respond_to do |format|
      if @note
        format.js
      else
        @note = Note.new
        @note.user_id = current_user.id
        @note.reminder = "Click the edit link above to add a reminder..."
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
  
  # This renders the current public user message
  def public_show
    respond_to do |format|
      format.js {render template: "profiles/public_save"}
    end
  end
  
  # This finds or creates a new public user note
  def public_load
    @note = Note.find_by_user_id(current_user.id)
    respond_to do |format|
      if @note
        format.js
      else
        @note = Note.new
        @note.user_id = current_user.id
        @note.public = "Click the edit link above to add your thought to share..."
        @note.save
        format.js
      end
    end 
  end
  
  # This saves an updated public user note
  def public_save
    @note = Note.find_by_user_id(current_user.id)
    respond_to do |format|
      @note.public = params[:public]
      @note.save
      format.js
    end
  end
  
  # This saves a users bio attribute
  def bio_save
    @note = current_user.note
    @note.bio = params[:note][:bio]
    @note.save
    @user = current_user
    respond_to do |format|
      if @note.save
        format.js
      else
        format.js {render "shared/save_failed"}
      end
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

