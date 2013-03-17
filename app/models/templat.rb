class Templat < ActiveRecord::Base
  belongs_to :school
  has_many :tasks
  
  default_scope order: 'name ASC'
  
  attr_accessible :content, :name, :public, :school_id, :content_type
end
