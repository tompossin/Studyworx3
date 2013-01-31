class Admin::ToolsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @books = Book.all
    @school = School.find(current_user.school)
    @nav_body_content = "admin/assignments/toolbar"
  end

  def book
    @book = Book.find(params[:book_id])
    respond_to do |format|
      format.html {redirect_to admin_book_paragraphs_path(@book)}
    end
  end
end
