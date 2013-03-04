class Document < ActiveRecord::Base
  attr_accessible :assignment_id, :content, :content_type, :school_id, :task_id, :user_id
end
