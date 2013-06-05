module BlogsHelper
  
  # This changes the status display depending on the value of blog.leadstory
  def story_status(leadstory)
    if leadstory == nil
      return "Draft"
    elsif leadstory == true
      return "True"
    elsif leadstory == false
      return "False"
    end
  end
  
end