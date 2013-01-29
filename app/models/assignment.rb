class Assignment < ActiveRecord::Base
  has_many :duedates
  has_many :tasks
  belongs_to :school
  
  attr_accessible :book_id, :instructions, :module, :name, :order, :resources, :school_id, :scoresheet_id, :weight
  
  # Validations for Assignments
  validates :name, :module, :school_id, :weight, :instructions, presence: true
  validates :weight, :module, :inclusion => {:in => 0..100}
  
end
