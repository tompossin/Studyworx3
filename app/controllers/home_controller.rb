class HomeController < ApplicationController
  before_filter :authenticate_user!
  

  def index
    @email = current_user.email
  end

end
