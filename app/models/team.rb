# This handles teams management. 
# * Many other team functions are handled through messages and assignments
class Team < ActiveRecord::Base
  has_and_belongs_to_many :users
  
  attr_accessible :description, :name, :owner_id, :school_id, :coreteam
  ##########################################################
  validates_presence_of :name, :owner_id
  
end
