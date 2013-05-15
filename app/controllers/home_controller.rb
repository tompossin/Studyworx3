class HomeController < ApplicationController
  before_filter :load_school
  before_filter :load_note

  # This is really just a framework now
  # TODO Add a search field to search by category
  # TODO Maybe add a full text search
  # TODO May need to add the exerpt/lead-in to give short intros that can be displayed on the home page.
  def index
    @current_article = Blog.where("leadstory=?",true).first
    @features = Blog.where("featured = ?",true).order("updated_at, leadstory DESC")
    @stories = Blog.where("featured = ?",false).order("updated_at DESC")
  end
  
  def show
    @current_article = Blog.find(params[:id])
    @features = Blog.where("featured = ?",true).order("updated_at, leadstory DESC")
    @stories = Blog.where("featured = ?",false).order("updated_at DESC")
    render :index
  end
  
  private
  
  def load_note
    if current_user
      unless current_user.note
        note = Note.create(user_id: current_user.id)
        current_user.note = note
      end
    end      
  end
  
  def load_school
    if current_user
      if current_user.school > 0
        @school = School.find(current_user.school)
      else
        @school = false
      end
    else
      @school = false
    end
  end

end
