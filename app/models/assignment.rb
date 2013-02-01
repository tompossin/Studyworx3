class Assignment < ActiveRecord::Base
  has_many :duedates, :dependent => :destroy
  has_many :tasks, :dependent => :destroy
  belongs_to :school
  
  default_scope order: 'module ASC'
  
  attr_accessible :book_id, :instructions, :module, :name, :order, :resources, :school_id, :scoresheet_id, :weight
  
  # Validations for Assignments
  validates :name, :module, :school_id, :weight, :instructions, presence: true
  validates :weight, :module, :inclusion => {:in => 0..100}
  
end
