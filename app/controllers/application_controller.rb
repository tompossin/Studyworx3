class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :assign_session_variables
  
  protected
  
  # Check if logged in, check for session[:values], or set session[:values]
  # TODO I need a default setting for some of these variables
  def assign_session_variables
    if current_user
      unless session[:admin_level]
        admin = UserAdmin.find_by_user_id(current_user.id)
        if admin
          session[:admin_level] = admin.level
        else
          session[:admin_level] = 0
        end
      end
      unless session[:avatar_image]
        if current_user.avatar
          avatar = Mercury::Image.find(current_user.avatar)
          session[:avatar] = avatar.id 
          session[:avatar_image] = avatar.image_file_name
        end
      end
      unless session[:wallpaper_image]
        if current_user.wallpaper
          wallpaper = Mercury::Image.find(current_user.wallpaper)
          session[:wallpaper] = wallpaper.id 
          session[:wallpaper_image] = wallpaper.image_file_name
        end
      end
    end
  end
  
  # These methods are used as before_filters in controllers
    
  def is_superadmin
    user = UserAdmin.find_by_user_id(current_user.id)
    unless user and user.level == 3
      redirect_to root_path, alert: "You must be a Super Administrator to access this page (click to hide)"
    end
  end
  
  def is_admin
    user = UserAdmin.find_by_user_id(current_user.id)
    unless user and user.level > 1
      redirect_to root_path, alert: "You must be an adminstrator to access this page (click to hide)"
    end
  end
  
  def is_contributor
    user = UserAdmin.find_by_user_id(current_user.id)
    unless user and user.level > 0
      redirect_to root_path, alert: "You must be a contributor to access this page (click to hide)"
    end
  end
  ########## End before filters #################
  
  ##### Methods available to all controllers
  def is_owner(user_id)
    unless current_user.id == user_id
      redirect_to root_path, alert: "You are not the owner of this record!"
    end
  end
  
end
