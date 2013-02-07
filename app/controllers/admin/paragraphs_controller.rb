class Admin::ParagraphsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  before_filter :load_book
  before_filter :load_school
  
  def index
    @paragraphs = @book.paragraphs.where(:version_id => @school.version_id).all
    @version = Version.find(@school.version_id)
  end

  def show
    
  end

  def edit
    @paragraph = Paragraph.find(params[:id])
    
    respond_to do |format|
      format.js
    end
  end

  def new
    @paragraph = @book.paragraphs.new
    @paragraphs = Paragraph.unscoped.where(:version_id => @school.version_id,:book_id=>@book.id).order("position DESC").limit(10)
    @version = Version.find(@school.version_id)
    
  end
  
  def create
    @paragraph = @book.paragraphs.new(params[:paragraph])
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  private
  
  def load_book
    @book = Book.find(params[:book_id])
  end
  
  def load_school
    @school = School.find(current_user.school)
  end
  
end
