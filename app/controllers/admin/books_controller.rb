class Admin::BooksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(params[:book])
    respond_to do |format|
      if @book.save
        format.html {redirect_to admin_books_url}
      else
        format.html {render :new}
      end
    end
  end
  
  def update
    @book = Book.find(params[:book_id])
    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html {redirect_to admin_books_url, alert: "Saved!"}
      else
        format.html {render :edit}
      end
    end
  end
  
  # Destroys the current Book only if there are no dependent records
  def destroy
    @book = Book.find(params[:id])
    @book.destroy_if_no_dependents
    respond_to do |format|
      unless @book
        format.html {redirect_to admin_books_path, notice: "Book Destroyed"}
      else
        format.html {redirect_to admin_books_path, alert: "Book can not be destroyed - it has dependent records."}
      end
    end
  end
  
end
