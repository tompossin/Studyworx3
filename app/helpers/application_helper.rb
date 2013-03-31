
module ApplicationHelper
  include FormatContent
  
  # Return the full name of the current_user
  # DEPRECATED use current_user.fullname instead
  def full_name 
    if current_user
      current_user.firstname + " " + current_user.lastname
    else
      "Please Log in"
    end
  end
  
  # Gets the full name of the supplied user_id
  # INFO it usually better to find a way to user.fullname
  # Although it is not always possible to use the model fullname method.
  def get_full_name(user_id)
    if user_id
      u = User.find(user_id)
      return u.firstname + " " + u.lastname
    else
      return "Unknown"
    end
  end
  
  # Gets the name for a school_id
  # INFO for use when calling associated models will not work.
  def get_school_name(school_id)
    if school_id
      school = School.select(:name).find(school_id)
      return school.name
    else
      return "Public"
    end
  end
  
  def get_assignment_name(assignment_id)
    a = Assignment.find(assignment_id)
    return a.name
  end
  
  # Takes accepted status and returns a text color as a style attribute
  def status_color(accepted)
    if accepted == 0
      return "style=\"color:red;\""
    elsif accepted == 1
      return "style=\"color:gray;\""
    elsif accepted == 2
      return "style=\"color:black;\""
    else
      return "style=\"color:red;\""
    end
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
  
  def get_team_name(team_id)
    team = Team.find(team_id)
    return team.name
  end
  
  def relaxed_sanitize(rawhtml)
    sanitize rawhtml,:tags=> %w(div p a img blockquote pre h1 h2 h3 h4 h5 h6 table thead tbody tfoot th tr td span ol li ul br b strong em i u ),
                      :attributes=> %w(id class style src border align colspan rowspan)
  end
  
  # This loads the right editor and tools for the content_type
  # * 1 == html
  # * 0 == markdown (Default)
  # * With this settup I could conceivably add other content_types later.
  def smart_edit(content_type=0,save_url)
    if content_type == 1
      render "shared/wysihtml5_js", {url: save_url}
    else
      render "shared/autosave_js", {url: save_url}
    end
  end
  
  # This examines the content_type field and formats content accordingly.
  # 
  # This object must have a content_type field of the integer type
  # * 0 = markdown
  # * 1 = html
  def smart_format(content_type=0,content)
    if content_type == 0
      return markdown_to_html(content)
    else
      return sanitize(content)
    end
  end
  
  # This is a drop in replacement using Redcarpet. 
  # This looks simple but was a real pain to configure.
  def formatter(content)
    render_options = {hard_wrap: true, filter_html: true, safe_links_only: true}
    markdown_options = {no_intraemphasis: true, autolink: true, superscript: true}
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(render_options),markdown_options)
    return markdown.render(content).html_safe
  end
  
  # Sets the nav_bar(nav_body_content = optional url of partial for nav_body_content element)
  def nav_bar(nav_body_content = false)
    nbc = nav_body_content || Settings.default_nav_body
    render :partial=>"layouts/nav_bar", :locals=>{content: full_name, nav_body_content: nbc}
  end
  
  # Include standard error code for form validation
  #  Usage: include_form_validation_errors(@object)
  def include_form_validation_errors(record_object)
    render :partial => "shared/errors", :locals => {:record => record_object }
  end
  
  # return the name of the template when given the templat_id
  def get_templat_name(templat_id=false)    
    if templat_id
      t = Templat.find(templat_id)
      return t.name
    else
      return "None"
    end
  end
  
  # This assigns friendly names to task_types
  def get_task_type_name(id=false)
    if id == 1
      "Document"
    elsif id == 2
      "Discussion"
    elsif id == 3
      "Charting"
    elsif id == 4
      "Off-line"
    else
      "None"
    end
  end
  
  # changes color by t=true/false
  # Returns whatever color is given in the 2nd and 3rd attribute
  # Defaults to tcolor="green" and fcolor="gray"
  # Useful for changing background/foreground colors on object lists with boolean attributes.
  def set_color(t,tcolor="green",fcolor="gray")
    if t
      tcolor
    else
      fcolor
    end
  end
  
  # Sets a message in response to true/false
  # This is a generic version of set_color it produces string responses to T/F input
  # * t = true/false the rest is pretty obvious.
  def tfmsg(t,tmsg="True",fmsg="False")
    if t
      tmsg
    else
      fmsg
    end
  end
  
  # Checks for superadmin in the view
  def is_superadmin
    user = UserAdmin.find_by_user_id(current_user.id)
    if user and user.level == 3
      return true || false
    end
  end
  
  # Check if this user has the status of Admin
  def is_admin
    user = UserAdmin.find_by_user_id(current_user.id)
    if user and user.level > 1
      return true || false
    end
  end
  
  # Check if this user has the status of Contributor
  def is_contributor
    user = UserAdmin.find_by_user_id(current_user.id)
    if user and user.level >0
      return true || false
    end
  end
  
  # Check if a user has the role or staff or greater
  def is_staff
    if current_user.role < 4
      return true || false
    end
  end
  
  # Hides a page element unless a condition is met.
  def hidden_div_unless(condition, attributes = {}, &block)
    unless condition
      attributes["style"] = "display: none;"
    end
    content_tag("div", attributes, &block)
  end
  
  
  def content_type_link(content_type,url)
    if content_type == 1
      msg = "Switch to Markdown Editor"
    else
      msg = "Switch to HTML Editor"
    end
    return "<a href='#{url}' data-method='POST'>#{msg}</a>"
  end
  
  # Sets the wallpaper
  def set_wallpaper
    if current_user
      if current_user.wallpaper 
        if session[:wallpaper]
          return "background-image:url('#{current_user.wallpaper.url}');"
        else
          if session[:bgcolor]
            return "background-color: #{session[:bgcolor]};"
          else
            return Settings.default_background_color
          end
        end
      else
        return Settings.default_background_color
      end
    else
      return Settings.default_background_color
    end
  end
  
  # Set main css file
  def set_preferences
      unless current_user.preference
        pref = Preference.create(user_id: current_user.id,theme: "base-right",bgcolor: "white",rows: 20, wallpaper: false)
      else
        pref = Preference.where(user_id: current_user.id).first
      end
        session[:theme] = pref.theme
        session[:bgcolor] = pref.bgcolor
        session[:rows] = pref.rows
        session[:wallpaper] = pref.wallpaper
  end
  
  # Set css file
  def set_css
    if current_user
      unless session[:theme]
        set_preferences
      end
      return session[:theme]
    else
      return "base-right"
    end
  end
  
end
