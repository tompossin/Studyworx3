class Admin::ToolsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_school_admin
  before_filter :is_admin, only: [:book]
  before_filter :get_school
  
  def index
    @books = Book.all
    @versions = Version.all
    @nav_body_content = "admin/assignments/toolbar"
  end
  
  def personnel
    @participants = @school.participants.order("role_id ASC").all
    @nav_body_content = "admin/assignments/toolbar"
  end
  
  def edit_participant
    @participant = Participant.find(params[:id])
    @teams = @school.coreteams
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
    @participant = Participant.includes(:user).find(params[:id])
    @user = @participant.user
    
    respond_to do |format|
      if @participant.role_id >= current_user.role
        if @participant.update_attributes(params[:participant])
          @user.change_to_coreteam(params[:coreteam])
          @user.set_school(@participant.school_id)
          if @participant.accepted == 2
            Notifier.participant_acceptance(@participant,@school).deliver
          end
          format.js 
        else
          format.js { render "shared/save_failed" }
        end
      else
        format.js {render "illegal_role"}
      end
    end
  end
  
  # FIXME This is broken needs to load a selector for editing books. (very low priority)
  def book
    #@book = Book.find(params[:book_id])
    #@version = Version.find(params[:version_id])
    #@paragraphs = @book.paragraphs.where(:version_id => @version.id).all
    respond_to do |format|
      format.html {redirect_to admin_version_book_paragraphs_url(params[:version_id],params[:book_id])}
    end
  end
  
  private
  
  def get_school
    @school = School.find(current_user.school)
  end
end
