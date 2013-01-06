class Assignment < ActiveRecord::Base
  has_many :duedates
  belongs_to :school
  belongs_to :book
  
  attr_accessible :book_id, :instructions, :module, :name, :order, :resources, :school_id, :scoresheet_id, :weight
end
