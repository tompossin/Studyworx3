module ApplicationHelper
  
  # Return the full name of the current_user
  def full_name 
    return current_user.firstname + " " + current_user.lastname
  end
  
  # Checks for superadmin in the view
  def is_superadmin
    user = UserAdmin.find_by_user_id(current_user.id)
    if user and user.level == 3
      return true || false
    end
  end
  def is_admin
    user = UserAdmin.find_by_user_id(current_user.id)
    if user and user.level > 0
      return true || false
    end
  end
  
  # Hides a page element unless a condition is met.
  def hidden_div_unless(condition, attributes = {}, &block)
    unless condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end
  
  # Sets the wallpaper
  def set_wallpaper
    if current_user
      if current_user.wallpaper  
        return "background-image:url('/system/images/#{session[:wallpaper]}/original/#{session[:wallpaper_image]}');"
      else
        return "background-color:#dddddd;"
      end
    else
      return "background-color:#dddddd;"
    end
  end
  
end
