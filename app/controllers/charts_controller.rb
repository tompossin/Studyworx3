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
      if @assignment.editable?(current_user)
        format.html 
      else
        format.html {redirect_to task_print_charts_url(@task)}
      end
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
    check_state_and_update
    @titles = Title.build_horizontal_collection(@task.id,current_user.id)
    
    respond_to do |format| 
      format.html 
    end
  end
  
  def print
    check_state_and_update    
    build_all_charts(@task.id,current_user.id)
    @verticals = Title.get_segments(@task.id,current_user.id)
    respond_to do |format|
      format.html
      format.pdf do
        filename = @task.assignment.name+"_"+@task.name
        content = render_to_string template: "charts/print"
        output = convert_file(content, current_user, filename, "pdf")
        send_file(output[:filepath], filename: output[:filename])
      end
    end
  end
  
  def download
    check_state_and_update
    @verticals = Title.get_segments(@task.id,current_user.id)
    build_all_charts(@task.id,current_user.id)
    content = render_to_string template: "charts/download"
    filename = @task.assignment.name+"_"+@task.name
    
    output = convert_file(content, current_user, filename, params[:file_type])
    send_file(output[:filepath], filename: output[:filename])
  end
  
  # Charting toolkit
  def tools
    @segments = Title.get_segments(@task.id,current_user.id)
    @vertical = @task.titles.new(segnum: 0) # this is necessary when this is loaded seperate from the rest of the charting page.
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
    @url = task_charttext_path(@task,@charttext)
    
    respond_to do |format|
      format.js
    end
  end
  
  # Adds a staffnote to a chartext if user is staff else just fetch
  def charttext_staffnote
    @charttext = Charttext.find(params[:charttext_id])
    @staffnote = @charttext.staffnotes.first
    unless @staffnote or current_user.student?
      @staffnote = @charttext.staffnotes.create(user_id: @charttext.user_id, assignment_id: @charttext.title.assignment_id)
    end
    respond_to do |format|
      format.js {render "staffnote" }
    end
  end
  
  # This saves the charttext and returns the appropriate response depending on the state of things
  def save_charttext
    @charttext = Charttext.find(params[:charttext_id])
    assignment = Assignment.find(@task.assignment_id)
    respond_to do |format|
      if assignment.editable?(current_user)
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
      else
        format.js {render "shared/pastdue"}
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
  
  # Loads the editor for an existing Ppoint
  def edit_ppoint
    @ppoint = Ppoint.find(params[:ppoint_id] )
    @observations = Observation.select([:id, :name]).where("school_id = ?", current_user.school).all
    
    respond_to do |format|
      format.js 
    end
  end
  
  # Add a staffnote to a ppoint if the user is a staff otherwise just fetch
  def ppoint_staffnote
    @ppoint = Ppoint.find(params[:ppoint_id])
    @staffnote = @ppoint.staffnotes.first
    unless @staffnote or current_user.student?
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
    assignment = Assignment.find(@task.assignment_id)
    
    respond_to do |format|
      if assignment.editable?(current_user)
        if @ppoint.update_attributes(params[:ppoint])
          format.js 
        else
          format.js { render "shared/save_failed" }
        end
      else
        format.js { render "shared/pastdue" }
      end
    end
  end
  
  def cancel_ppoint
    respond_to do |format|
      @ppoint = Ppoint.find(params[:ppoint_id])
      if @ppoint.content == nil
        @ppoint.content = "Add content"
        @ppoint.save
      end
      
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
    assignment = Assignment.find(@task.assignment_id)
    
    respond_to do |format|
      if assignment.editable?(current_user)
        if @title
          State.update_state(current_user.id,@title.task_id)
          format.js
        else
          format.js { render "insert_failed" }
        end
      else
        format.js { render "shared/pastdue" }
      end
    end
  end
  
  
  def title_staffnote
    @title = Title.find(params[:title_id])
    @staffnote = @title.staffnotes.first
    unless @staffnote or current_user.student?
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
        State.update_state(current_user.id,@title.task_id)
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
    State.update_state(current_user.id,@title.task_id)
    
    respond_to do |format|
      format.js
    end
  end
  
  # This destroys all titles and all dependencies - (slow)
  def destroy_all
    Title.where("task_id = ? and user_id = ?",params[:task_id],current_user.id).destroy_all
    State.update_state(current_user.id,params[:task_id])
    
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
  
  def check_state_and_update
    state = State.update_state(current_user.id,@task.id)
    unless state.uptodate
      Title.build_tree(@task.id,current_user.id)
    end 
  end
  
  
end
