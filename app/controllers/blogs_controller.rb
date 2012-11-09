class BlogsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  
  def index
    @blogs = Blog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blogs }
    end
  end

  # GET /blogs/1
  # GET /editor/blogs/1 to edit with Mercury
  def show
    @blog = Blog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blog }
    end
  end

  # GET /blogs/new
  # Creates a new blank blog entry
  def new
    @blog = Blog.new
    @blog.user_id = current_user.id
    @blog.topic = "Add Title here"
    @blog.category = "Add Category here"
    @blog.article = "Add Article Content here"
    @blog.save
    redirect_to blogs_path
  end

  # PUT /blogs/1
  # PUT /blogs/1.json
  def update
    @blog = Blog.find(params[:id])
    @blog.topic = params[:content][:topic][:value].strip.delete "\n" 
    @blog.category = params[:content][:category][:value].strip.delete "\n"
    @blog.article = params[:content][:article][:value]
    @blog.save!
    render text: ""
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url }
      format.json { head :no_content }
    end
  end
end
