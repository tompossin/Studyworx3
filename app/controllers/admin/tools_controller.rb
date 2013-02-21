class Admin::ToolsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_school_admin
  before_filter :is_superadmin, only: [:book]
  before_filter :get_school, except: [:book]
  
  def index
    @books = Book.all
    @nav_body_content = "admin/assignments/toolbar"
  end
  
  def personnel
    @participants = @school.participants.order("role_id ASC").all
    @nav_body_content = "admin/assignments/toolbar"
  end
  
  def edit_participant
    @participant = Participant.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
  
  def cancel_edit
    respond_to do |format|
      format.js
    end
  end
  
  def update_participant
    @participant = Participant.find(params[:id])
    
    respond_to do |format|
      if @participant.role_id <= current_user.role
        if @participant.update_attributes(params[:participant])
          format.js 
        else
          format.js { render "shared/save_failed" }
        end
      else
        format.js {render "illegal_role"}
      end
    end
  end

  def book
    @book = Book.find(params[:book_id])
    respond_to do |format|
      format.html {redirect_to admin_book_paragraphs_path(@book)}
    end
  end
  
  private
  
  def get_school
    @school = School.find(current_user.school)
  end
end
