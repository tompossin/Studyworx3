class DocumentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_task, only: [:new, :related_documents]
  include FormatContent
  require 'tempfile'
  layout "print", only: [:print, :download]
  
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
    assignment = @document.assignment
    @normal = true

    respond_to do |format|
      if assignment.editable?(current_user)
        format.html
      else
        format.html {redirect_to document_print_path(@task)}
      end
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
  
  # This displays a printable version of the document
  def print
    @document = Document.where(user_id: current_user.id,task_id: params[:document_id]).first
    
    respond_to do |format|
      format.html 
    end
  end
  
  # This creates and downloads the requested file type
  def download
    # TODO fix routes so they make more sense
    # This is nutty the :document_id is actually the :task_id
    # I must have been trying to save time - didn't work ;(
    @task = Task.find(params[:document_id])
    @document = Document.where("user_id = ? and task_id = ?", current_user.id, params[:document_id]).first
    if @document
      content = render_to_string template: "documents/download"
      filename = @document.assignment.name+"_"+@document.task.name
      
      download = convert_file(content, current_user, filename, params[:file_type])
      send_file(download[:filepath], filename: download[:filename]) 
    else
      redirect_to school_assignment_path(current_user.school,@task.assignment_id), notice: "No Content available for this task."
    end
  end
  
  # task_related_documents_path(@task)
  # /task/:task_id/documents/related
  def related_documents
    @documents = Document.includes(:assignment,:task).where("user_id = ? and assignment_id = ?",current_user.id,@task.assignment_id).all
    respond_to do |format|
      format.js
    end
  end
  
  # all_user_documents_path
  # documents/all/user
  def all_user
    @documents = Document.includes(:assignment,:task).where("user_id = ?",current_user.id).reorder("assignments.name ASC").all
    respond_to do |format|
      format.js {render :related_documents}
    end
  end
  
  # document_sidebar_view_path(@document)
  # document/:document_id/sidebar
  def sidebar
    @document = Document.find(params[:document_id])
    respond_to do |format|
      format.js
    end
  end
  
  # document_sidebar_edit_path(@document)
  # document/:document_id/sidebar/edit
  def sidebar_edit
    @document = Document.find(params[:document_id])
    respond_to do |format|
      format.js
    end
  end


  # Updates document (by the owner)
  def update
    @document = Document.where("user_id = ? and id = ?",current_user.id,params[:id]).first
    assignment = @document.assignment
    respond_to do |format|
      if assignment.editable?(current_user)
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
      else
        format.js { render "shared/pastdue" }
      end
    end
  end
  
  def staffnote
    @document = Document.find(params[:document_id])
    @staffnote = @document.staffnotes.first
    unless @staffnote
      @staffnote = @document.staffnotes.create(user_id: @document.user_id, assignment_id: @document.assignment_id)
    end
    respond_to do |format|
      format.js
    end
  end
  
  # update staffnote only (by the staff)
  def update_staffnote
    @document = Document.find(params[:id])
    @document.staff_note = params[:document][:staff_note]
    respond_to do |format|
      if current_user.role < 4
        if @document.save
          format.js {render "shared/save_success"}
        else
          format.js {render "shared/save_failed"}
        end
      else
        format.js {render "shared/save_failed"}
      end
    end
  end

  # DELETE /documents/1
  def destroy
    @document = Document.where("user_id = ? and id = ?",current_user.id,params[:id]).first
    @document.destroy

    respond_to do |format|
      format.html { redirect_to schools_url }
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
