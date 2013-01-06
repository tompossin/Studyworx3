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
  
  # Locates a given users avatar url
  def get_avatar_url(user_id)
    u = User.find_by_id( user_id)
    avatar = u.avatar.url(:thumb)
    unless u.avatar_file_size?
      avatar = false
    end
    return avatar || Settings.avatar_image  
  end
  
  # Sets the nav_bar(nav_body_content = optional url of partial for nav_body_content element)
  def nav_bar(nav_body_content = false)
    nbc = nav_body_content || Settings.default_nav_body
    render :partial=>"layouts/nav_bar", :locals=>{content: full_name, nav_body_content: nbc}
  end

  # This formats plain text into VERY basic html.
  # This should only be used for small text objects.
  # Clearly not the fastest car on the strip.
  # I am going for safe and dead simple here.
  def formatter(content)
    content = strip_links(content)
    newstr = ""
    unless content.nil?
      content.each_line() do |l|
        l.rstrip!
        if l.match(/\^\^/)
          l.gsub!(/\^\^/, "")
          newstr<<content_tag("p",l,class: "title larger")
        elsif l.match(/\>\>/)
          l.gsub!(/\>\>/,"")
          newstr<<content_tag("p",l,class: "title large right")
        elsif l.match(/\+\+/)
          l.gsub!(/\+\+/,"")
          newstr<<content_tag("p",l,class: "title small bolder")
        elsif l.match(/\"\"/)
          l.gsub!(/\"\"/,"")
          newstr<<content_tag("blockquote",l)
        elsif l.match(/\/\//)
          l.gsub!(/\/\//,"")
          newstr<<content_tag("p",l,class: "italic")
        elsif l.match(/\*\s/)
          l.gsub!(/\*/,"")
          newstr<<content_tag("ul",content_tag("li",l))
        elsif l.match(/\s\s\s\s/)
          l.gsub!(/\s\s\s\s/,"")
          newstr<<content_tag("p",l,class: "indent_double")
        elsif l.match(/\s\s/)   
          l.gsub!(/\s\s/,"")
          newstr<<content_tag("p",l,class: "indent")
        elsif l.match(/::/)
          l.gsub!(/::/,"")
          newstr<<content_tag("a",l,{ href: "#{l}",target: "_blank"})
        else
          newstr<<content_tag("p",l) 
        end    
      end
    end
    return sanitize(newstr)
  end
  
  # changes color by t=true/false
  # Returns whatever color is given in the 2nd and 3rd attribute
  # Defaults to tcolor="green" and fcolor="gray"
  # Useful for changing background/foreground colors on object lists with boolean attributes.
  # Conceivably this could return any reasonable string in response to True/False.
  # But really should be renamed for that sort of thing.
  def set_color(t,tcolor="green",fcolor="gray")
    if t
      tcolor
    else
      fcolor
    end
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
  
  # This inserts the standard validation errors block into a form
  def validation_errors_block(formobject)
    render("/shared/validation_errors_block", {object: formobject})
  end
  
  # Sets the wallpaper
  # TODO this may need to moved or eliminated it is an ugly hack.
  def set_wallpaper
    if current_user
      if current_user.wallpaper  
        return "background-image:url('#{current_user.wallpaper.url}');"
      else
        return "background-color:#dddddd;"
      end
    else
      return "background-color:#dddddd;"
    end
  end
  
end
