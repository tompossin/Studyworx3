class Team < ActiveRecord::Base
  has_and_belongs_to_many :participants
  
  attr_accessible :description, :icon, :name
end
