class AssignmentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_school
  layout "print", only: [:printall,:printallcentered]
  include Imaging
  include FormatContent

  # Loads Assignment help
  def help
		@assignment = Assignment.find(params[:assignment_id])

		respond_to do |format|
			format.js
		end
  end

  # This is the Assignment home page
  def show
    @assignment = @school.assignments.find(params[:id])
    @grade = @assignment.grades.where("user_id = ?",current_user.id).first
    @checker = User.find(@grade.staff_id) if @grade and @grade.staff_id
    respond_to do |format|
      format.html
    end
  end

  # This prints all tasks
  def printall
    @assignment = Assignment.find(params[:assignment_id])
    @tasks = Task.where("assignment_id = ? and task_type = ?",@assignment.id,1).all
    @chart = Task.where("assignment_id = ? and task_type = ?",@assignment.id,3).first
    if @chart
      check_state_and_update
      build_all_charts(@chart.id,current_user.id)
      @verticals = Title.get_segments(@chart.id,current_user.id)
    end

  end

  # This prints all charts with the vertical charts centered.
  # This facilitates those that want to use this for creating charts blanks for hand charting.
  def printallcentered
    @assignment = Assignment.find(params[:assignment_id])
    @tasks = Task.where("assignment_id = ? and task_type = ?",@assignment.id,1).all
    @chart = Task.where("assignment_id = ? and task_type = ?",@assignment.id,3).first
    if @chart
      check_state_and_update
      build_all_charts(@chart.id,current_user.id)
      @verticals = Title.get_segments(@chart.id,current_user.id)
    end

  end

  # This calculates the time remaining to complete an assignment
  def time_remaining
    coreteam = current_user.coreteam

    respond_to do |format|
      if coreteam
        @duedate = Duedate.where("assignment_id = ? and team_id = ?",params[:assignment_id], coreteam.id).first
        format.js
      else
        format.js {render "shared/no_coreteam"}
      end
    end
  end

  private

  def load_school
    @school = School.find(params[:school_id])
  end

  # Checks on the state of the @chart(Task) that you are trying to render.
  def check_state_and_update
    state = State.update_state(current_user.id,@chart.id)
    unless state.uptodate
      Title.build_tree(@chart.id,current_user.id)
    end
  end

end
