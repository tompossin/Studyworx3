class UserAdminsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_superadmin
  
  # GET /user_admins
  # GET /user_admins.json
  def index
    @users = UserAdmin.search(params[:search])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_admins }
    end
  end
  

  # GET /user_admins/1
  # GET /user_admins/1.json
  def show
    @user_admin = UserAdmin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_admin }
    end
  end

  ##### Not using this for now - running everything through edit
  def new
    @user_admin = UserAdmin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_admin }
    end
  end
  ############################################################
  
  # GET /user_admins/1/edit
  def edit
    @user_admin = UserAdmin.find_by_user_id(params[:id])
    @user = User.find(params[:id])
    unless @user_admin
      @user_admin = UserAdmin.create(user_id: params[:id],level: 0)
    end
  end

  # POST /user_admins
  # POST /user_admins.json
  def create
    @user_admin = UserAdmin.new(params[:user_admin])

    respond_to do |format|
      if @user_admin.save
        format.html { redirect_to @user_admin, notice: 'User admin was successfully created.' }
        format.json { render json: @user_admin, status: :created, location: @user_admin }
      else
        format.html { render action: "new" }
        format.json { render json: @user_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_admins/1
  # PUT /user_admins/1.json
  def update
    @user_admin = UserAdmin.find(params[:id])

    respond_to do |format|
      if @user_admin.update_attributes(params[:user_admin])
        format.html { redirect_to user_admins_path, notice: 'User admin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_admins/1
  # DELETE /user_admins/1.json
  def destroy
    @user_admin = UserAdmin.find(params[:id])
    @user_admin.destroy

    respond_to do |format|
      format.html { redirect_to user_admins_url }
      format.json { head :no_content }
    end
  end
end
