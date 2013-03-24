class Assignment < ActiveRecord::Base
  has_many :duedates, :dependent => :destroy
  has_many :tasks, :dependent => :destroy
  has_many :documents
  has_many :turnins
  has_many :grades
  belongs_to :scoresheet
  belongs_to :school
  acts_as_list
  
  default_scope order: 'module ASC'
  
  attr_accessible :book_id, :instructions, :module, :name, :position, :resources, :school_id, :scoresheet_id, :weight
  
  # Validations for Assignments
  validates :name, :module, :school_id, :weight, :instructions, presence: true
  validates :weight, :module, :inclusion => {:in => 0..100}
  
  

  
end
