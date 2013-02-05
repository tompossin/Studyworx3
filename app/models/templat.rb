class Templat < ActiveRecord::Base
  belongs_to :school
  
  default_scope order: 'name ASC'
  
  attr_accessible :content, :name, :public, :school_id
end
