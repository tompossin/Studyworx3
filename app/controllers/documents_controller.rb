class DocumentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_task, only: [:new ]
  include FormatContent
  
  # This shows a formatted preview version of the current document.
  def show
    @document = Document.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
  
  # Loads or Creates a [document->endnote] if necessary.
  def new
    @document = Document.find_or_create(current_user.id, params[:school_id], params[:assignment_id], params[:task_id])
    endnote = Endnote.find_or_create_by_document_id(@document.id)
    @normal = true

    respond_to do |format|
      format.html 
    end
  end
  
  def normal
    @document = Document.find(params[:document_id])
    @task = @document.task
    @normal = true
    
    respond_to do |format|
      format.html { render :new }
    end
  end
  
  # Fullscreen editing
  def fullscreen
    @document = Document.find(params[:document_id])
    @task = @document.task
    @normal = false

    respond_to do |format|
      format.html 
    end
  end


  # Updates document
  # TODO endnote w/ autosave
  def update
    @document = Document.where("user_id = ? and id = ?",current_user.id,params[:id]).first

    respond_to do |format|
      if @document.update_attributes(params[:document])
        @autopreview = @document
        unless params[:autopreview]
          format.js { render "shared/save_success" }
        else
          format.js { render "shared/autopreview" }
        end
      else
        format.js { render "shared/save_failed" }
      end
    end
  end

  # DELETE /documents/1
  # TODO Implement w/ AJAX
  def destroy
    @document = Document.where("user_id = ? and id = ?",current_user.id,params[:id]).first
    @document.destroy

    respond_to do |format|
      format.html { redirect_to documents_url }
    end
  end
  
  # show endnote editor
  def endnote
    @endnote = Endnote.find_by_document_id(params[:document_id])
    respond_to do |format|
      format.js
    end
  end
  
  def update_endnote
    @endnote = Endnote.find_by_document_id(params[:document_id])
    respond_to do |format|
      if @endnote.update_attributes(params[:endnote])
        format.js
      else
        format.js {render "shared/save_failed"}
      end
    end
  end
  
  # Load assignment instructions in the popup window
  def assignment_instructions
    d = Document.find(params[:document_id])
    @assignment = d.assignment
    
    respond_to do |format|
      format.js
    end
  end
  
  # Load task instructions in the popup window
  def task_instructions
    d = Document.find(params[:document_id])
    @task = d.task
    
    respond_to do |format|
      format.js
    end
  end
  
  # Toggle the data type of the record
  def toggle_type
    @document = Document.toggle_type(params[:document_id])
    if @document.content_type == 1
      @document.content = markdown_to_html(@document.content)
      @document.save
    else
      @document.content = html_to_markdown(@document.content)
      @document.save
    end
    @task = Task.find(@document.task_id)
    respond_to do |format|
      format.html {render :new }
    end
  end
  
  private
  
  def get_task
    @task = Task.find(params[:task_id])
  end
  
end
