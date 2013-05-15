# === Admin Interface for Profiles
# path = /admin/profiles/action

class Admin::ProfilesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  
  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
