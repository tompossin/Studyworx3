class HomeController < ApplicationController
  before_filter :load_school

  # TODO This is really just a framework now
  # * Fix the navbar so that only featured stories show
  # * Add a search field to search by category
  # * Maybe add a full text search
  # * May need to add the exerpt/lead-in to give short intros that can be displayed on the home page.
  def index
    @current_article = Blog.where("leadstory=?",true).first
    @stories = Blog.find(:all,:order =>'navbar and featured and updated_at DESC')
  end
  
  def show
    @current_article = Blog.find(params[:id])
    @stories = Blog.find(:all,:order =>'navbar and featured and updated_at DESC')
    render :index
  end
  private
  
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
