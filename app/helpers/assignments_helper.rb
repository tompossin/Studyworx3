module AssignmentsHelper
  
  # This creates the links to the appropriate tools for the given task
  def get_task_link(school,assignment,task)
    if task.task_type == 3 # Charting Task
      link_to(task.name, task_charts_start_path(task),{title: "Click to begin Charting."})
    elsif task.task_type == 2 # Discussion Task
      link_to(task.name,"/")
    elsif task.task_type == 1 # document type task
      link_to(task.name, new_school_assignment_task_document_path(school,assignment,task),{title: "Click to work on this task."})
    else
      task.name
    end
  end
  
end
