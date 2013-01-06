class Task < ActiveRecord::Base
  attr_accessible :assignment_id, :help, :name, :percent, :task_order, :task_type, :templat_id
end
