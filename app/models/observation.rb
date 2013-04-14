class Observation < ActiveRecord::Base
  belongs_to :school
  
  #############################
  default_scope order: 'name ASC'
  ##############################
  
  attr_accessible :code, :name, :position, :public, :school_id
  
  validates :code, :name, :school_id, presence: true
  
end
