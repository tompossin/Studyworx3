class Admin::VersionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  
  def index
    @versions = Version.all
  end
  
  def show
    @version = Version.find(params[:id])
  end
  
  def edit
    @version = Version.find(params[:id])
  end
  
  def new
    @version = Version.new
  end
  
  def create
    @version = Version.new(params[:version])
    respond_to do |format|
      if @version.save
        format.html {redirect_to admin_versions_url}
      else
        format.html {render :new }
      end
    end
  end
  
  def update
    @version = Version.find(params[:id])
    respond_to do |format|
      if @version.update_attributes(params[:version])
        format.html {redirect_to admin_versions_url }
      else
        format.html {render :edit, alert: "Save Failed"}
      end
    end
  end
  
  # Destroys current Version if there are no dependent records
  def destroy
    @version = Version.find(params[:id])
    @version.destroy_if_no_dependents
    respond_to do |format|
      unless @version
        foramt.html {redirect_to admin_versions_url, notice: "Version destroyed"}
      else
        format.html {redirect_to admin_versions_url, alert: "Has dependent records"}
      end
    end
  end
  
  
end
