class Task < ActiveRecord::Base
  belongs_to :assignment
  
  attr_accessible :assignment_id, :help, :name, :percent, :task_order, :task_type, :templat_id
end
