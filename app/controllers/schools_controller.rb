class SchoolsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_contributor, :only=>[:index, :new, :update, :create, :destroy]
  
  # GET /schools
  # GET /schools.json
  def index
    @school = School.find_by_id(current_user.school)
    load_school_vars

    respond_to do |format|
      if current_user.school < 1
        format.html # index.html.erb
      else
        format.html { render :homeroom }
      end
    end
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
    @school = School.find(params[:id])
    load_school_vars

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @school }
    end
  end
  
  # This is the default page for a participant.
  def homeroom
    @school = School.find(current_user.school)
    load_school_vars
    
    respond_to do |format|
      format.html 
    end
  end
  
  # Sets the users current school
  def set_current
    school_changed = User.set_school(params[:id],current_user.id)
    @current_user = User.find(current_user.id) 
    @school = School.find(current_user.school)
    respond_to do |format|
      if school_changed
        flash[:notice] = "Changed default school to #{@school.name}"
        format.html {redirect_to homeroom_school_path }
      else
        flash[:alert] = "Failed to change default school"
        format.html {redirect_to :index }
      end
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
  
  private
  # This loads standard school variables to keep things DRY
  def load_school_vars
    @schools = School.all_active
    @my_schools = current_user.schools.where(:active => true)
    @nav_body_content = "schools/schools"
  end
end
