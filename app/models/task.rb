class Task < ActiveRecord::Base
  belongs_to :assignment
  
  default_scope order: 'task_order ASC'
  
  attr_accessible :assignment_id, :help, :name, :percent, :task_order, :task_type, :templat_id
end
