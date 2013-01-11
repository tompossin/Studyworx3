class Assignment < ActiveRecord::Base
  has_many :duedates
  has_many :tasks
  belongs_to :school
  
  attr_accessible :book_id, :instructions, :module, :name, :order, :resources, :school_id, :scoresheet_id, :weight
end
