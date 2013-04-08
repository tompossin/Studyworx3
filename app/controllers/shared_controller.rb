# This controller does not really do anything it is just a location
# for certain shared calls like "cancel" so I do not have to keep
# writing code for cancel buttons and whatnot.
class SharedController < ApplicationController
  before_filter :authenticate_user!
  
  
  # ----------
  # :section: Generic Shared Methods
  # These can be called from anywhere.
  # ----------
  
  # This calculates the time and displays it in the notice element
  # It requires assignment_id as a param
  def time_remaining
    assignment = Assignment.find(params[:assignment_id])
    @duedate = assignment.duetime(current_user)

    respond_to do |format|
      format.js
    end
  end
  
  # This method can be called from any link pointed here.
  #
  # It should be called with
  #  <%=link_to "cancel", shared_cancel_path, {remote: true, id: "cancel"} %>
  #
  # This removes the _parent_ element of the cancel link.
  def cancel
    respond_to do |format|
      format.js
    end
  end
  
  # This method closes the popup that is part of the application layout page.
  #
  # This calls a js file that sets the class to invisible.
  # * The loading of the #popup element and making it visible is left to other controllers.
  #  Usage: <%=link_to "close", shared_close_popup_path, {remote: true} %>
  def close_popup
    respond_to do |format|
      format.js
    end
  end
  
    
  # This sends a disappearing saved failed message to #alert.
  #
  # It is usually not called from here but as a fallback render call
  # from create or update calls in other controllers.
  def save_failed
    respond_to do |format|
      format.js
    end
  end
  
  # This sends a disappearing save success message to #notice.
  #
  # It is usually not called from here but as a fallback call
  # from create or update calls in other controllers.
  def save_success
    respond_to do |format|
      format.js
    end
  end
  
  # ----------
  # :section: Help Methods
  # These are help methods for things like the Markdown editors.
  # ----------
  
  # Markdown Help
  def help
    @help = Help.find(params[:id])

    respond_to do |format|
      format.js {render :help }
    end
  end
  
end