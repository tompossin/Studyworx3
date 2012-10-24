module ApplicationHelper
  def full_name 
    return current_user.firstname + " " + current_user.lastname
  end
end
