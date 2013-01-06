class Book < ActiveRecord::Base
  has_many :paragraphs
  
  attr_accessible :name, :short_name, :verse_count
end
