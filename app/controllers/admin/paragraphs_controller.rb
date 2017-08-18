class Admin::ParagraphsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  before_filter :load_version
  before_filter :load_book
  before_filter :load_school

  def index
    @paragraphs = @book.paragraphs.where(:version_id => @version.id).all
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
    @paragraph = @book.paragraphs.new(version_id: @version.id)
    @paragraphs = Paragraph.unscoped.where(:version_id => @version.id,:book_id=>@book.id).order("position DESC").limit(10)
    @new = true
  end

  def insert
    @current = Paragraph.find(params[:paragraph_id])
    @paragraph = @current.insert_above(current_user)

    respond_to do |format|
      format.js
    end
  end

  def create
    @paragraph = @book.paragraphs.new(params[:paragraph])
    @paragraph.next_position
    @paragraph.content = current_user.firstname
    @paragraph.save
    respond_to do |format|
      format.html {redirect_to new_admin_version_book_paragraph_url(@version,@book)}
    end
  end

  def update
    @paragraph = Paragraph.find(params[:id])
    respond_to do |format|
      if @paragraph.update_attributes(params[:paragraph])
        format.js
      else
        format.js
      end
    end
  end

  def cancel
    @paragraph = Paragraph.find(params[:paragraph_id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @paragraph = Paragraph.find(params[:id])
    @id = @paragraph.id
    @paragraph.reorder_after_delete
    respond_to do |format|
      if @paragraph.destroy
        format.js
      else
        format.js {render "shared/delete_failed"}
      end
    end
  end

  private

  def load_version
    @version = Version.find(params[:version_id])
  end

  def load_book
    @book = Book.find(params[:book_id])
  end

  def load_school
    @school = School.find(current_user.school)
  end

end
