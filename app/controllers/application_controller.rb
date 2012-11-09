class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :assign_session_variables
  
  protected
  
  def assign_session_variables
    if current_user
      admin = UserAdmin.find_by_user_id(current_user.id)
      session[:admin_level] = admin.level if admin
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
    unless user and user.leve > 0
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
