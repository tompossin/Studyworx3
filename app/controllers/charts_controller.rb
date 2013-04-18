class ChartsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_task
  layout "print", only: [:print, :download]
  include Imaging
  include FormatContent
 
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
  # TODO build a model method for checking book size and loading appropriate titles a ppoints
  # INFO this could be worked into the build_tree method.
  def charting
    state = State.find_or_create_by_user_id(current_user.id)
    unless state.uptodate
      Title.build_tree(@task.id,current_user.id)
    end 
    @titles = Title.build_horizontal_collection(@task.id,current_user.id)
    
    respond_to do |format| 
      format.html 
    end
  end
  
  def print
    @verticals = Title.get_segments(@task.id,current_user.id)
    build_all_charts(@task.id,current_user.id)
    respond_to do |format|
      format.html
    end
  end
  
  def download
    @verticals = Title.get_vertical_charts(@task.id,current_user.id)
    content = render_to_string template: "charts/download"
    filename = @task.assignment.name+"_"+@task.name
    
    output = convert_file(content, current_user, filename, params[:file_type])
    send_file(output[:filepath], filename: output[:filename])
  end
  
  # Charting toolkit
  def tools
    @segments = Title.get_segments(@task.id,current_user.id)
    @id = 0
    respond_to do |format|
      format.js
    end
  end
  
  # Loads the editor for vertical charting
  def vertical
    @segments = Title.get_segments(@task.id,current_user.id)
    @vertical = Title.find(params[:vertical_id])
    @charttext = Charttext.find_or_create_by_title_id(title_id: @vertical.id, user_id: current_user.id,content_type: 0)
    @ptitles = @vertical.children
    @next_seg = @vertical.find_next
    @prev_seg = @vertical.find_previous
    @id = 0
    @url = task_charttext_path(@task,@charttext)
    
    respond_to do |format|
      format.js
    end
  end
  
  def charttext_staffnote
    @charttext = Charttext.find(params[:charttext_id])
    @staffnote = @charttext.staffnotes.first
    unless @staffnote
      @staffnote = @charttext.staffnotes.create(user_id: @charttext.user_id, assignment_id: @charttext.title.assignment_id)
    end
    respond_to do |format|
      format.js {render "staffnote" }
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
    title = Title.find(params[:title_id])
    @ppoint = Ppoint.create(title_id: params[:title_id],user_id: title.user_id,color: 'black',position: 0 )
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
  
  def ppoint_staffnote
    @ppoint = Ppoint.find(params[:ppoint_id])
    @staffnote = @ppoint.staffnotes.first
    unless @staffnote
      @staffnote = @ppoint.staffnotes.create(user_id: @ppoint.user_id, assignment_id: @ppoint.title.assignment_id)
    end
    respond_to do |format|
      format.js {render "staffnote" }
    end
  end
  
  # Save the edited Paragraph point and render the new page element.
  def save_ppoint
    @ppoint = Ppoint.find(params[:ppoint_id])
    if params[:ppoint][:content].empty?
      params[:ppoint][:content] = "Add content here."
    end
    
    respond_to do |format|
      if @ppoint.update_attributes(params[:ppoint])
        format.js 
      else
        format.js { render "shared/save_failed" }
      end
    end
  end
  
  def cancel_ppoint
    respond_to do |format|
      @ppoint = Ppoint.find(params[:ppoint_id])
      
      format.js { render "save_ppoint"}
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
        State.update_state(current_user.id)
        format.js
      else
        format.js {render "insert_failed"}
      end
    end
  end
  
  def title_staffnote
    @title = Title.find(params[:title_id])
    @staffnote = @title.staffnotes.first
    unless @staffnote
      @staffnote = @title.staffnotes.create(user_id: @title.user_id, assignment_id: @title.assignment_id)
    end
    respond_to do |format|
      format.js {render "staffnote" }
    end
  end
  
  # This saves a title after editing
  # TODO Must have been on crack when I named title.title instead of title.content may need to refactor that someday
  def save
    @title = Title.find(params[:title_id])
    @title.title = @title.clean_input(params[:title])
    
    respond_to do |format|
      if @title.save
        State.update_state(current_user.id)
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
    State.update_state(current_user.id)
    
    respond_to do |format|
      format.js
    end
  end
  
  # This destroys all titles and all dependencies - (slow)
  def destroy_all
    Title.where("task_id = ? and user_id = ?",@task.id,current_user.id).destroy_all
    State.update_state(current_user)
    
    respond_to do |format|
      format.js
    end
  end
  
  private
  
  # Get assignment and duetime for the current selection
  def get_task
    @task = Task.find(params[:task_id])
    @assignment = Assignment.find(@task.assignment_id)
  end
  
  
  
end
