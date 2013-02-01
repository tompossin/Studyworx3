module Admin::AssignmentsHelper
  
  def count_assignments(mod_id)
    count = Assignment.where(school_id: current_user.school, module: mod_id).count
    return count || false
  end
end
