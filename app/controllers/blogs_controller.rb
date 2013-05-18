class BlogsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  
  # TODO I will need to put some limits or paging on this yet.
  def index
    @blogs = Blog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blogs }
    end
  end

  # GET /blogs/1
  def show
    @blog = Blog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blog }
    end
  end
  
  # Loads the appropriate editor
  # TODO create partials for wysihtml5 and markdown
  def edit
    @blog = Blog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
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
    @blog.remove_previous_lead_story(params[:blog][:leadstory])

    @blog.update_attributes(params[:blog])
    respond_to do |format|
      unless params[:autopreview]
        format.html {render :show }
        format.js {render "shared/save_success"}
      else
        format.html {render :show}
        format.js {render "autopreview"}
      end
    end
  end
  
  # Toggles the content_type attribute and reloads corrected editor
  def toggle_content_type
    @blog = Blog.find(params[:blog_id])
    @blog.change_content_type
    respond_to do |format|
      format.html {render :edit}
    end
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
