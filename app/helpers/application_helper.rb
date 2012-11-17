module ApplicationHelper
  
  # Return the full name of the current_user
  def full_name 
    return current_user.firstname + " " + current_user.lastname
  end
  
  def nav_heading(content)
    render :partial=>"layouts/navhead", :locals=>{:content => content}
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
