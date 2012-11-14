class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin, :only=>[:reviewboard, :update_reviewboard, :setstock]
  
  # This is just a controller it will be calling
  # pages that edit the users table. 
  # This will give an understandable url and will
  # make it easier to avoid route conflicts with
  # devise.
  
  def index
    
  end
  
  def show
    @participants = Participant.find_all_by_user_id(current_user.id)
    @images = Mercury::Image.find_all_by_user_id(current_user.id)
    @stockimages = Mercury::Image.find_all_by_user_id(0)
  end
  
  # This will only edit the profile portion of the
  # user record.
  def edit
    
  end
  
  def saveprofile
    user = User.find(current_user.id)
    user.bio = params[:content][:bio][:value]
    user.phone = params[:content][:phone][:value]
    user.address = params[:content][:address][:value]
    user.save!
    render text: ""
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
  
  def setwallpaper
    user = User.find(current_user.id)
    user.wallpaper = params[:profile_id]
    user.save
    w = Mercury::Image.find(user.wallpaper)
    session[:wallpaper] = user.wallpaper
    session[:wallpaper_image] = w.image_file_name
    redirect_to profile_path(current_user.id)
  end
  
  def settheme
    
  end
  
  def setstock
    stock = Mercury::Image.find(params[:profile_id])
    stock.user_id = 0
    stock.save
    redirect_to profile_path(current_user.id)
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
end

