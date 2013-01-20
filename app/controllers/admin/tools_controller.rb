class Admin::ToolsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  
  def index
    @books = Book.all
  end

  def book
    @book = Book.find(params[:book_id])
    respond_to do |format|
      format.html {redirect_to admin_book_paragraphs_path(@book)}
    end
  end
end
