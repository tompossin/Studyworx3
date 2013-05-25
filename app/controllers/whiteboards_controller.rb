class WhiteboardsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_school_admin
  before_filter :load_school
  
  # GET /whiteboards
  def index
    @whiteboards = Whiteboard.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /whiteboards/1
  def show
    @whiteboard = Whiteboard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /whiteboards/new
  def new   
    respond_to do |format|
      if @school.whiteboard
        @whiteboard = @school.whiteboard
        @whiteboard.user_id = current_user.id
        format.html {render :edit }
      else
        @whiteboard = Whiteboard.new
        @whiteboard.school_id = current_user.school
        @whiteboard.user_id = current_user.id
        format.html 
      end
    end
  end

  # GET /whiteboards/1/edit
  def edit
    @whiteboard = Whiteboard.find(params[:id])
    @whiteboard.user_id = current_user.id
  end

  # POST /whiteboards
  def create
    @whiteboard = Whiteboard.new(params[:whiteboard])

    respond_to do |format|
      if @whiteboard.save
        format.html { redirect_to schools_path, notice: 'Whiteboard was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /whiteboards/1
  def update
    @whiteboard = @school.whiteboard

    respond_to do |format|
      if @whiteboard.update_attributes(params[:whiteboard])
        format.html { redirect_to schools_path, notice: 'Whiteboard was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /whiteboards/1
  def destroy
    @whiteboard = @school.whiteboard
    @whiteboard.destroy

    respond_to do |format|
      format.html { redirect_to schools_path }
    end
  end
  
  private
  
  def load_school
    @school = School.find(current_user.school)
  end
  
end
