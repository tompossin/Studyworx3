class Grade < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignment
  belongs_to :school
  
  attr_accessible :assignment_id, :grade, :school_id, :scratchpad, :staff_comments, :staff_id, :student_comments, :user_id
  
    
  
end

