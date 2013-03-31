class Admin::ObservationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_school_admin
  before_filter :get_school
  before_filter :set_nav_bar
  
  # GET /observations
  # GET /observations.json
  def index
    @observations = @school.observations.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @observations }
    end
  end

  # GET /observations/1
  # GET /observations/1.json
  def show
    @observation = Observation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @observation }
    end
  end

  # GET /observations/new
  # GET /observations/new.json
  def new
    @observation = @school.observations.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @observation }
    end
  end

  # GET /observations/1/edit
  def edit
    @observation = Observation.find(params[:id])
    
  end

  # POST /observations
  # POST /observations.json
  def create
    @observation = Observation.new(params[:observation])

    respond_to do |format|
      if @observation.save
        format.html { redirect_to admin_school_observations_url(@school), notice: 'Observation was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /observations/1
  # PUT /observations/1.json
  def update
    @observation = Observation.find(params[:id])

    respond_to do |format|
      if @observation.update_attributes(params[:observation])
        format.html { redirect_to admin_school_observations_url(@school), notice: 'Observation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @observation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /observations/1
  # DELETE /observations/1.json
  def destroy
    @observation = Observation.find(params[:id])
    @observation.destroy

    respond_to do |format|
      format.html { redirect_to admin_school_observations_url(@school) }
    end
  end
  
  private
  
  def get_school
    @school = School.find(current_user.school)
  end
  
  def set_nav_bar
    @nav_body_content = "admin/assignments/toolbar"
  end
  
end
