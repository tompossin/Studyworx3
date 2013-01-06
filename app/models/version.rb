class Version < ActiveRecord::Base
  has_many :paragraphs
  
  attr_accessible :name
end
