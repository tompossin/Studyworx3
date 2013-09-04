class ImagesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_task
  before_filter :clear_image_files
  include Imaging
  
  # Images stored at: data/user_id/school_id/charts/assignment.name/filename
  def index
    Title.build_tree(@task.id,current_user.id)
    @segments = Title.get_segments(@task.id,current_user.id)   

    respond_to do |format|
      format.js
    end
  end
  
  def download_horizontal
    is_ready = Title.charts_ready?(@task.id,current_user.id)
    respond_to do |format|
      format.html do
        if is_ready
          build_standard_horizontal(@task.id,current_user.id)
          download = horizontal_file
          send_file(download[:filepath], filename: download[:filename])
        else         
          redirect_to school_assignment_path(current_user.school,@task.assignment_id), notice: "No Horizontal"
        end
      end 
    end 
  end
  
  def download_vertical
    is_ready = Title.charts_ready?(@task.id,current_user.id)
    vertical = Title.find(params[:vertical_id])
    respond_to do |format|
      format.html do
        if is_ready
          build_standard_vertical(@task,current_user.id,vertical.id)
          download = vertical_file(vertical.segnum)
          send_file(download[:filepath], filename: download[:filename])
        else
          redirect_to school_assignment_path(current_user.school,@task.assignment_id), notice: "No Vertical Chart"
        end
      end
    end
  end
  
  def all_verticals
    is_ready = Title.charts_ready?(@task.id,current_user.id)
    if is_ready
      
    end
    
  end
  
  def download_all_charts
    is_ready = Title.charts_ready?(@task.id,current_user.id)
    respond_to do |format|
      format.html do
        if is_ready
          zip_all_charts(@task,current_user.id)
          download = zip_file
          send_file(download[:filepath], filename: download[:filename])
        else
          redirect_to school_assignment_path(current_user.school,@task.assignment_id), notice: "No Charts"
        end
      end
    end
  end
  
  private
  
    # Get assignment and duetime for the current selection
    def get_task
      @task = Task.find(params[:task_id])
      @assignment = Assignment.find(@task.assignment_id)
    end
    
    def clear_image_files
      clear_images(current_user.id)
    end
    
    def horizontal_file
      file = @task.clean_name(current_user.id.to_s+"_"+@assignment.name+"_horizontal.jpg")   
      return {filename: file, filepath: "public/images/#{file}"}
    end
    
    def vertical_file(segment_number)
      file = @task.clean_name(current_user.id.to_s+"_"+@assignment.name+"_vertical_"+segment_number.to_s+".jpg")
      return {filename: file, filepath: "public/images/#{file}"}
    end
    
    def zip_file
      file = @task.clean_name(current_user.id.to_s+"_"+@assignment.name+".zip")   
      return {filename: file, filepath: "public/images/#{file}"}
    end
  
  
end
