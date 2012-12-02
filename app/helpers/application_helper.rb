module ApplicationHelper
  
  # Return the full name of the current_user
  def full_name 
    if current_user
      current_user.firstname + " " + current_user.lastname
    else
      "Please Log in"
    end
  end
  
  # Gets the full name of the supplied user_id
  def get_full_name(user_id)
    u = User.find(user_id)
    return u.firstname + " " + u.lastname
  end
  # Sets the nav_bar(nav_body_content = optional url of partial for nav_body_content element)
  def nav_bar(nav_body_content = false)
    default = "layouts/nav_blank"
    nbc = nav_body_content || default
    render :partial=>"layouts/nav_bar", :locals=>{content: full_name,nav_body_content: nbc}
  end
  
  # this fetches and creates the image url's for a list of avatar's
  # TODO look for a more efficient way to do this.
  def get_avatar_url(user_id)
    u = User.find(user_id)
    i = Mercury::Image.find(u.avatar)
    return "/system/images/#{i.id}/thumb/#{i.image_file_name}"
  end
  
  def format_plaintext(content)
    content.gsub!(/\n/,'<br />')
    content.gsub!(/\s\s/,'&nbsp;&nbsp;&nbsp;&nbsp;')
    content.gsub!(/\*\*/,'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&diams;&nbsp;')
    content.gsub!(/\*/,'&nbsp;&nbsp;&nbsp;&bull;&nbsp;')
    return content
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
  
  # Provides a more relaxed version of sanitize these rules match the
  # ones provided by the mercury editor. So I don't get unexpected
  # results from an edit.
  #
  # WARNING! I have included iframe in here which is crazy but necessary
  # to include youtube and vimeo videos.
  def relaxed_sanitize(rawhtml)
    sanitize rawhtml,:tags=> %w(div p a img iframe blockquote pre h1 h2 h3 h4 h5 h6 table thead tbody tfoot th tr td span ol li ul br b strong em i u ), 
                      :attributes=> %w(id class style src border align colspan rowspan)
  end
  
  # Hides a page element unless a condition is met.
  def hidden_div_unless(condition, attributes = {}, &block)
    unless condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end
  
  # Sets the wallpaper
  # TODO this may need to moved or eliminated it is an ugly hack.
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
