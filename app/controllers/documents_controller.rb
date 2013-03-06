class DocumentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_task, only: [:new]
  
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

    respond_to do |format|
      format.html 
    end
  end


  # Updates document
  # TODO add ajax
  # TODO autosave
  # TODO endnote w/ autosave
  # TODO check ownership
  def update
    @document = Document.find(params[:id])

    respond_to do |format|
      if @document.update_attributes(params[:document])
        format.js { render "shared/save_success"}
      else
        format.js { render "shared/save_failed" }
      end
    end
  end

  # DELETE /documents/1
  # TODO Implement w/ AJAX
  # TODO check ownership
  def destroy
    @document = Document.find(params[:id])
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
  
  private
  
  def get_task
    @task = Task.find(params[:task_id])
  end
  
end
