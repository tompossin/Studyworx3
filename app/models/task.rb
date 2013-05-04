class Task < ActiveRecord::Base
  belongs_to :assignment, inverse_of: :tasks
  belongs_to :templat, inverse_of: :tasks
  has_many :documents, inverse_of: :task
  has_many :titles, inverse_of: :task
  has_many :comments, inverse_of: :task
  
  
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
  
  # Get the assignment name
  def assignment_name
    a = Assignment.find(self.assignment_id)
    return a.name
  end
  
end
