class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  
  protected
  
  def is_superadmin
    user = UserAdmin.find_by_user_id(current_user.id)
    unless user and user.level=3
      #flash[:alert] = "You must be a Super Administrator to access this page (click to hide)"
      redirect_to root_path, alert: "You must be a Super Administrator to access this page (click to hide)"
    end
  end
  
  def is_admin
    user = UserAdmin.find_by_user_id(current_user.id)
    unless user and user.level < 0
      #flash[:alert] = "You must be an administrator to access this page (click to hide)"
      redirect_to root_path, alert: "You must be an adminstrator to access this page (click to hide)"
    end
  end
end
