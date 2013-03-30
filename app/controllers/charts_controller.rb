class ChartsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_assignment
  
  # Start page for charting.
  def start
    
  end
  
  private
  
  # Get assignment and duetime for the current selection
  def get_assignment
    @assignment = Assignment.find(params[:assignment_id])
    @duetime = @assignment.duetime(current_user)
  end
  
  
  
end
