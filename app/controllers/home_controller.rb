class HomeController < ApplicationController

  def index
    @current_article = Blog.find_by_leadstory(1)
    @stories = Blog.find(:all,:order =>'navbar and featured and updated_at DESC')
  end
  
  def show
    @current_article = Blog.find(params[:id])
    @stories = Blog.find(:all,:order =>'navbar and featured and updated_at DESC')
    render :index
  end
  private
  
end
