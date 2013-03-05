class AssignmentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_school
  
  def index
  end

  # This is the Assignment home page
  def show  
    @assignment = @school.assignments.find(params[:id])
  end

  def edit
  end

  def new
  end
  
  private
  
  def load_school
    @school = School.find(params[:school_id])
  end
  
end
