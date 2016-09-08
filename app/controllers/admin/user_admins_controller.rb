# === Admin Interface for User Admins
# Accessed /admin/user_admins/action
class Admin::UserAdminsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_superadmin
  
  # GET /admin/user_admins
  def index
    @users = UserAdmin.search(params[:search])

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  

  # GET /admin/user_admins/1
  def show
    @user_admin = UserAdmin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  ##### Not using this for now - running everything through edit
  def new
    @user_admin = UserAdmin.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end
  ############################################################
  
  # GET /admin/user_admins/1/edit
  def edit
    @user_admin = UserAdmin.find_by_user_id(params[:id])
    @user = User.find(params[:id])
    unless @user_admin
      @user_admin = UserAdmin.create(user_id: params[:id],level: 0)
    end
  end

  # GET /admin/user_admins/1/details
  def details
    @user_admin = UserAdmin.find(params[:id])
    @user = User.find(params[:id])

  end

  # POST /admin/user_admins
  def create
    @user_admin = UserAdmin.new(params[:user_admin])

    respond_to do |format|
      if @user_admin.save
        format.html { redirect_to [:admin,@user_admin], notice: 'User admin was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /admin/user_admins/1
  def update
    @user_admin = UserAdmin.find(params[:id])

    respond_to do |format|
      if @user_admin.update_attributes(params[:user_admin])
        format.html { redirect_to admin_user_admins_path, notice: 'User admin was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /admin/user_admins/1
  def destroy
    @user_admin = UserAdmin.find(params[:id])
    @user_admin.destroy

    respond_to do |format|
      format.html { redirect_to admin_user_admins_url }
    end
  end
end
