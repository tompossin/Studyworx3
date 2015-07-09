class OrdersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_superadmin, only: [:index, :destroy]
  
  def index
    @orders = Order.order("updated_at DESC").all
    @school = School.find(current_user.school)
    check_for_pending_registrations
    @nav_body_content = "schools/registrations"
    
    respond_to do |format|
      format.html
    end
  end

  def show
    @order = Order.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    @order = Order.new(user_id: params[:user_id])
    user = User.find(params[:user_id])
    @user_schools = user.schools_i_own
    respond_to do |format|
      format.html
    end
  end

  def edit
    @order = Order.find(params[:id])
    user = User.find(@order.user_id)
    @user_schools = user.schools_i_own
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @order = Order.new(params[:order])
    @order.clone = params[:clone]
    @user_schools = current_user.schools_i_own
    respond_to do |format|
      if @order.save
        format.html {redirect_to schools_url }
      else
        format.html { render :edit }
      end
    end
  end
  
  def update
    @order = Order.find(params[:id])
    @order.clone = params[:clone]
    @user_schools = current_user.schools_i_own
    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { render :show }
      else
        format.html { render :edit }
      end
    end
  end
  
  def create_school
    user = User.find(params[:user_id])
    
    @school = School.new
    @school.name = params[:name]
    @school.location = params[:location]
    @school.email = user.email
    @school.start_date = params[:start_date]
    @school.end_date = params[:end_date]
    @school.description = params[:description]
    @school.timezone = "UTC"
    @school.active = false
    @school.owner_id = user.id
    @school.save
    
    @school.create_leader(user)
    
    @order = Order.find(params[:order_id])
    @order.school_id = @school.id
    @order.save
    
    if @order.clone
      school = School.find(@order.clone)
      @school.clone_school(school)
    end
    
    respond_to do |format|
      format.html { render :show }
    end
  end
  
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
    end
  end
    
end
