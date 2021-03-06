# === Application Controller
# ==== Shared Methods for all controllers
# These methods are available to all controllers and some of them are called before each call to a controller.
# 
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :assign_session_variables
  before_filter :set_time_zone
  
  protected
  
  # ==== This runs before each controller method call
  # Check if logged in, check for <tt>session[:values]</tt>, or set <tt>session[:values]</tt>
  # * This creates session values if they do not exist it does not alter them in any way.
  def assign_session_variables
    if current_user
      # Set user_admin level
      unless session[:admin_level]
        admin = UserAdmin.find_by_user_id(current_user.id)
        if admin
          session[:admin_level] = admin.level
        else
          session[:admin_level] = 0
        end
      end
      # set user preferences
      unless session[:theme]
        unless current_user.preference
          pref = Preference.create(user_id: current_user.id, wallpaper: false, rows: 20, bgcolor: "white", theme:"default-right")
        else
          pref = current_user.preference
          session[:wallpaper] = pref.wallpaper if pref.wallpaper
          session[:rows] = pref.rows if pref.rows
          session[:bgcolor] = pref.bgcolor if pref.bgcolor
          session[:theme] = pref.theme if pref.theme
        end
      end
    end
  end
  
  
  
  # Set the users timezone
  # INFO I may not want to call this on every call. This way it is sure to happen though ;)
  def set_time_zone
    if current_user
      if current_user.timezone
        Time.zone = current_user.timezone
      else
        Time.zone = "UTC"
      end
    else
      Time.zone = "UTC" 
    end
  end
  
# ------
# :section: Shared Methods
# The methods below can be called from any controller
# ------

  # ==== Can be used anywhere in a controller method
  # Checks if current_user is the record owner and returns true/false
  #
  # This is a convenience to make the controller code more readable.
  #
  # Useful for confirming ownership of records that are not looked up by <tt>current_user.id</tt>
  # 
  # ==== Usage:
  #  dostuff if is_owner(record_user_id)
  def is_owner(record_user_id)
    if current_user.id == record_user_id
      true
    else
      false
    end
  end
  
  def is_my_school?(school_id)
    school = School.find(school_id)
    if current_user.id == school.owner_id
      return true
    else
      return false
    end
  end
  
# ------
# :section: before_filters
# The methods below are used as before filters in controllers
# ------  

  # ==== before_filter (redirect on failure)
  # Unless the current_user is_superadmin this redirects to root path with a warning
  # * User.user_admin.level == 3 (me basically)
  def is_superadmin
    user = UserAdmin.find_by_user_id(current_user.id)
    unless user and user.level == 3
      redirect_to root_path, alert: "You must be a Super Administrator to access this page"
    end
  end
  
  # === before_filter (redirect on failure)
  # Unless the current_user is_admin this redirects to root path with a warning
  # * User.user_admin.level > 1
  # * Users of this sort can create contributors and edit more low level data.
  def is_admin
    user = UserAdmin.find_by_user_id(current_user.id)
    unless user and user.level > 1
      redirect_to root_path, alert: "You must be an adminstrator to access this page"
    end
  end
  
  # === Before_filter (redirect on failure)
  # Unless the current_user is_contributor this redirects to root path with a warning
  # * User.user_admin.level > 0
  # * Users of this sort can contribute to the public blog or submit peer reviewed papers
  def is_contributor
    user = UserAdmin.find_by_user_id(current_user.id)
    unless user and user.level > 0
      redirect_to root_path, alert: "You must be a contributor to access this page"
    end
  end
  
  # === Before_filter (redirect on failure)
  # Unless the current user is enroled and accepted in the current school they are not a student
  # * Participant.accepted == 0 is a pending application to a school
  # * Participant.accepted == 1 is a dropped/rejected application
  # * Participant.accepted == 2 is an accepted student
  def is_student
    unless current_user.role < 5
      redirect_to root_path, alert: "You must be a student to use this page"
    end
  end
  
  # === Before_filter (redirect on failure)
  # Unless the User has a current User.role < 4 they are redirected
  def is_school_staff
    unless current_user.role < 4
      redirect_to schools_path, alert: "You must be a school Staff to access this page."
    end
  end
  
  # === Before_filter (redirect on failure)
  # Unless the User has a current User.role < 3 they are redirected.
  def is_school_admin
    unless current_user.role < 3
      redirect_to schools_path, alert: "You must be a School Admin to access this page."
    end
  end
  
  # === Before_filter (redirect on failure)
  # unless the User has a current user.role < 2 they are redirected.
  def is_school_leader
    unless current_user.role < 2
      redirect_to schools_path, alert: "You must be the School Leader to access this page."
    end
  end
  
  # This checks for pending registrations and New School Requests
  def check_for_pending_registrations
    unless current_user.school == 0
      school = School.find(current_user.school)
      if current_user.admin_assistant?
        @registrations = school.participants.pending
      end
      if current_user.is_superadmin
        @pending_orders = Order.where("approved = ?",false).all
      else
        @pending_orders = Order.where("approved = ? and user_id = ?",false,current_user.id).all
      end   
    end   
  end
  
  

  
end
