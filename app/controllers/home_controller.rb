class HomeController < ApplicationController
  before_filter :set_session
  def index
    @stories = Blog.find(:all,:order =>'leadstory and updated_at DESC')
  end
  private
  def set_session
    if current_user
      admin = UserAdmin.find_by_user_id(current_user.id,:limit => '1')
      if admin
        session[:admin_level] = admin.level if admin.level > 0
      else
        session[:admin_level] = false
      end
    end
  end
end
