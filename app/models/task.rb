class Task < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :templat
  has_many :documents
  has_many :titles
  
  default_scope order: 'position ASC'
  
  attr_accessible :assignment_id, :help, :name, :percent, :position, :task_type, :templat_id
  
  validates_presence_of(:name, :task_type, :percent) 
  validates_numericality_of :percent, 
    greater_than_or_equal_to: 0, 
    less_than_or_equal_to: 100,
    message: "Must be between 0 and 100"
  
  # Cleans a string for use as a filename
  def clean_name(rawtext)
    rawtext.gsub(/[^A-Za-z0-9_\-\.]/, '_')
  end
  
end
