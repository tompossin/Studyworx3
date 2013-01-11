class Templat < ActiveRecord::Base
  belongs_to :school
  
  attr_accessible :content, :name, :public, :school_id
end
