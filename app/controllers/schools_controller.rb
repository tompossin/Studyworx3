class SchoolsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_contributor, :only=>[:index, :new, :update, :create, :destroy]
  # GET /schools
  # GET /schools.json
  def index
    @schools = School.all_active
    @my_schools = current_user.schools.where(:active => true)
    @nav_body_content = "schools/schools"

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
    @school = School.find(params[:id])
    @participants = Participant.includes(:school).where(user_id: current_user.id).all
    set_school(params[:id])
    @schools = School.all_active
    @my_schools = current_user.schools.where(:active => true)
    @nav_body_content = "schools/schools"

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @school }
    end
  end

  # GET /schools/new
  # GET /schools/new.json
  def new
    @school = School.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @school }
    end
  end

  # GET /schools/1/edit
  def edit
    @school = School.find(params[:id])
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(params[:school])

    respond_to do |format|
      if @school.save
        format.html { redirect_to @school, notice: 'School was successfully created.' }
        format.json { render json: @school, status: :created, location: @school }
      else
        format.html { render action: "new" }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schools/1
  # PUT /schools/1.json
  def update
    @school = School.find(params[:id])

    if @school.update_attributes(params[:school])
      render "shared/save_success"
    else
      render "shared/save_failed"
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school = School.find(params[:id])
    @school.destroy

    respond_to do |format|
      format.html { redirect_to schools_url }
      format.json { head :no_content }
    end
  end
end
