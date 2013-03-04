# === Blog Class
#
# This is not really a blog as much as it is the public facing pages of this site.
#
# Howto's, News and Helps will be the main content here.
class Blog < ActiveRecord::Base
  belongs_to :users
  
  attr_accessible :article, :category, :excerpt, :topic, :user_id, :featured, :leadstory, :content_type

  
  # Removes previous lead story if there is one
  #  Must be supplied with the value params[:blog][:leadstory]
  def remove_previous_lead_story(is_leadstory)
    if is_leadstory == "true"
      ls = Blog.where("leadstory=? and id <> ?",true,self.id).first
      if ls
        ls.leadstory = false
        ls.save 
      end
    end
  end
  
  def change_content_type
    if self.content_type == 0
      self.content_type = 1
    else
      self.content_type = 0
    end
    self.save
  end
  
end
