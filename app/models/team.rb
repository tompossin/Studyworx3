# This class has no controller it is handled by the Profiles_Controller
class Team < ActiveRecord::Base
  has_and_belongs_to_many :users
  
  attr_accessible :description, :name, :owner_id, :school_id
  ##########################################################
  
  
  
end
