module ApplicationHelper
  
  def full_name 
    return current_user.firstname + " " + current_user.lastname
  end
  def is_superadmin
    user = UserAdmin.find_by_user_id(current_user.id)
    if user and user.level>0
      return true || false
    end
  end
  
end
