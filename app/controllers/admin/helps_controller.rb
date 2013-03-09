class Admin::HelpsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @helps = Help.all
    
  end

  def show
    @help = Help.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def new
    @help = Help.create(title: "Add Title Here...",content: "Add help content...")
  end

  def edit
    @help = Help.find(params[:id])
  end
  
  def create
    @help = Help.create(params[:help])
    respond_to do |format|
      format.html { redirect_to :index }
    end
  end
  
  def update
    @help = Help.find(params[:id])
    respond_to do |format|
      if @help.update_attributes(params[:help])
        format.js {render "shared/save_success"}
      else
        format.js {render "shared/save_failed"}
      end
    end
  end
  
  def destroy
    @help = Help.find(params[:id])
    respond_to do |format|
      if @help.destroy
        format.html {redirect_to admin_helps_path, notice: "Delete Succeeded!" }
      else
        format.html {redirect_to admin_helps_path, alert: "Delete failed!"}
      end
    end
  end
  
end
