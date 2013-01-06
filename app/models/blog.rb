# === Blog Class
#
# This is not really a blog as much as it is the public facing pages of this site.
#
# Howto's, News and Helps will be the main content here.
class Blog < ActiveRecord::Base
  belongs_to :users
  
  attr_accessible :article, :category, :excerpt, :topic, :user_id, :featured, :leadstory

  
  # Removes previous lead story if there is one
  #  Must be supplied with the value params[:blog][:leadstory]
  def remove_previous_lead_story(is_leadstory)
    if is_leadstory
      ls = Blog.where("leadstory=? and id <> ?",true,self.id).first
      if ls
        ls.leadstory = false
        ls.save 
      end
    end
  end
  
end
