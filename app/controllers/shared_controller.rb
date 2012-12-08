# This controller does not really do anything it is just a location
# for certain shared calls like "cancel" so I do not have to keep
# writing code for cancel buttons and whatnot.
class SharedController < ApplicationController
  before_filter :authenticate_user!
  
  # This method can be called from any link pointed here.
  #
  # It should be called with {remote: true, id: "cancel"}
  #
  # This removes the parent element of the cancel link.
  def cancel
    respond_to do |format|
      format.js
    end
  end
  
  # This sends a disappearing saved failed message to #alert.
  #
  # It is usually not called from here but as a fallback call
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
  
end