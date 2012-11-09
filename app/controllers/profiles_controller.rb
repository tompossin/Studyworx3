class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin, :only=>[:reviewboard, :update_reviewboard]
  
  # This is just a controller it will be calling
  # pages that edit the users table. 
  # This will give an understandable url and will
  # make it easier to avoid route conflicts with
  # devise.
  
  def index
    
  end
  
  # This will only edit the profile portion of the
  # user record.
  def edit
    
  end
  # This can only be edited by an admin or better.
  def reviewboard
    @user = User.find(params[:profile_id])   
  end
  # must be admin or better
  def update_reviewboard
    user = User.find(params[:id])
    user.reviewboard = params[:reviewboard]
    user.save
    flash[:alert] = "The review board status has been updated"
    redirect_to user_admins_path
  end
  
  # There is no need for a create method since
  # devise creates the user records.
  
  # This will display the profile portion of the
  # user record.
  def show
    
  end
  
  def update
    if is_owner(params[:user_id])
      # need some action here.
      flash[:alert] = "Your profile has been updated!"
    else
      redirect_to root_path, alert: "You can only edit your own profile!"
    end
    
  end
end

