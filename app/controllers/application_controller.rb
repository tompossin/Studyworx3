# === Application Controller
# ==== Shared Methods for all controllers
# These methods are available to all controllers and some of them are called before each call to a controller.
# 
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :assign_session_variables
  
  protected
  
  # Check if logged in, check for <tt>session[:values]</tt>, or set <tt>session[:values]</tt>
  #
  # # This creates session values if they do not exist it does not alter them in any way.
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
      unless session[:school_name]
        session[:school_name] = "Select School Below"
      end
    end
  end

  def set_school(school_id)
    school = School.find(school_id)
    session[:school_name] = school.name
    session[:school_id] = school.id
  end
  
  # These methods are used as before_filters in controllers
    
  def is_superadmin
    user = UserAdmin.find_by_user_id(current_user.id)
    unless user and user.level == 3
      redirect_to root_path, alert: "You must be a Super Administrator to access this page"
    end
  end
  
  def is_admin
    user = UserAdmin.find_by_user_id(current_user.id)
    unless user and user.level > 1
      redirect_to root_path, alert: "You must be an adminstrator to access this page"
    end
  end
  
  def is_contributor
    user = UserAdmin.find_by_user_id(current_user.id)
    unless user and user.level > 0
      redirect_to root_path, alert: "You must be a contributor to access this page"
    end
  end
  
  def is_owner(user_id)
    unless current_user.id == user_id
      redirect_to root_path, alert: "You are not the owner of this record!"
    end
  end
  
end
