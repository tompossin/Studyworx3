class ChartsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_task
 
  # Start page for charting. It's the title homepage
  def start  
    if Title.is_started?(@task.id,current_user.id)
      @titles = Title.where("task_id = ? and user_id = ?",@task.id,current_user.id).all
    end
    
    respond_to do |format| 
      format.html 
    end
  end
  
  def autopopulate
    @titles = Title.autopopulate(@assignment,@task,current_user)
    respond_to do |format|
      format.js
    end
  end
  
  # This is the main page for editing insides/outsides. It's the charting homepage. 
  def charting
    Title.build_tree(@task.id,current_user.id)
    @titles = Title.where("task_id = ? and user_id = ? and title_type > 1",@task.id,current_user.id).all
    
  end
  
  # Charting toolkit
  def tools
    @segments = Title.get_segments(@task.id,current_user.id)
    @id = 0
    
  end
  
  # Loads the editor for vertical charting
  def vertical
    @segments = Title.get_segments(@task.id,current_user.id)
    @vertical = Title.find(params[:vertical_id])
    @charttext = Charttext.find_or_create_by_title_id(title_id: @vertical.id, user_id: current_user.id,content_type: 0)
    @ptitles = @vertical.children
    @id = 0
    @url = task_charttext_path(@task,@charttext)
    
    respond_to do |format|
      format.js
    end
  end
  
  def save_charttext
    @charttext = Charttext.find(params[:charttext_id])
    
    respond_to do |format|
      if @charttext.update_attributes(params[:charttext])
        @autopreview = @charttext
        unless params[:autopreview]
          format.js { render "shared/save_success" }
        else
          format.js { render "shared/autopreview" }
        end
      else
        format.js {render "shared/save_failed"}
      end
    end
  end
  
  # Create a new paragraph point and load the editor
  def new_ppoint
    @ppoint = Ppoint.create( title_id: params[:title_id], user_id: current_user.id, position: 0, content: "Add text" )
    @observations = Observation.select([:id, :name]).where("school_id = ?", current_user.school).all
    
    respond_to do |format|
      format.js
    end
  end
  
  def edit_ppoint
    @ppoint = Ppoint.find(params[:ppoint_id] )
    @observations = Observation.select([:id, :name]).where("school_id = ?", current_user.school).all
    
    respond_to do |format|
      format.js 
    end
  end
  
  # Save the edited Paragraph point and render the new page element.
  def save_ppoint
    @ppoint = Ppoint.find(params[:ppoint_id])
    
    respond_to do |format|
      if @ppoint.update_attributes(params[:ppoint])
        format.js 
      else
        format.js { render "shared/save_failed" }
      end
    end
  end
  
  # Destroy the paragraph point and clear the page element
  def delete_ppoint
    @ppoint = Ppoint.find(params[:ppoint_id])
    @ppoint_id = @ppoint.id.to_s
    @ppoint.destroy
    
    respond_to do |format|
      format.js
    end
  end
  
  # This loads the dialog for inserting new titles
  def new_title
    @title = Title.find(params[:title_id])
    
    respond_to do |format|
      format.js
    end
  end
  
  # This creates the title record of the type that the new_title method calls for
  def create_title
    old_title = Title.find(params[:title_id])
    @title = old_title.insert_title(params[:title_type].to_i)
    
    respond_to do |format|
      if @title
        format.js
      else
        format.js {render "insert_failed"}
      end
    end
  end
  
  # This saves a title after editing
  def save
    @title = Title.find(params[:title_id])
    new_title = @title.clean_input(params[:title])
    @title.title = new_title
    
    respond_to do |format|
      if @title.save
        format.js 
      else
        format.js {render "shared/save_failed"}
      end
    end
  end
  
  # Deletes a single title when called.
  def delete_title
    @title = Title.find(params[:title_id])
    position = @title.position
    @title.destroy
    Title.reorder_after_delete(@task.id,current_user.id,position)
    
    respond_to do |format|
      format.js
    end
  end
  
  # This destroys all titles and all dependencies - (slow)
  def destroy_all
    Title.where("task_id = ? and user_id = ?",@task.id,current_user.id).destroy_all
    
    respond_to do |format|
      format.js
    end
  end
  
  private
  
  # Get assignment and duetime for the current selection
  def get_task
    @task = Task.find(params[:task_id])
    @assignment = Assignment.find(@task.assignment_id)
    @duetime = @assignment.duetime(current_user)
  end
  
  
  
end
