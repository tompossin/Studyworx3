class Turnin < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignment
  
  attr_accessible :assignment_id, :comment, :done, :staff_id, :user_id
  
  validates :assignment_id, presence: true
  validates :user_id, presence: true
  
  # This finds, checks and creates turnin and grade records as needed from the student perspective.
  def self.find_or_create_by_student(school_id,student_id,assignment_id)
    
    # Check if the a turnin record exists or create one.
    t = self.where("user_id = ? and assignment_id = ?", student_id, assignment_id).first
    unless t
      t = self.create(user_id: student_id, assignment_id: assignment_id)
    end
    
    # Check if a matching grade exists or create one.
    g = Grade.where("user_id = ? and assignment_id = ?", student_id, assignment_id).first
    unless g # exists create a matching grade record
      a = Assignment.find(assignment_id)
      s = Scoresheet.find(a.scoresheet_id) unless a.scoresheet_id.nil?
      if s 
        scoresheet = s.content
      else
        scoresheet = "### Grading Notes..."
      end
      ng = Grade.create(school_id: school_id,user_id: student_id, assignment_id: assignment_id, scratchpad: scoresheet)
    end
    return t
  end
  
  # This finds, checks and creates turnin and grade records as needed from the staff perspective.
  def self.find_or_create_by_staff(school_id, student_id, staff_id, assignment_id)
    
    # Check if the a turnin record exists or create one.
    t = self.where("user_id = ? and assignment_id = ?", student_id, assignment_id).first
    unless t
      t = self.create(user_id: student_id, assignment_id: assignment_id, staff_id: staff_id)
    end
    
    # Check if a matching grade exists or create one.
    g = Grade.where("user_id = ? and assignment_id = ?", student_id, assignment_id).first
    if g # exists then update staff_id
      g.staff_id = staff_id
      g.staff_id.save
    else # create a matching grade record
      a = Assignment.find(assignment_id)
      s = Scoresheet.find(a.scoresheet_id) unless a.scoresheet_id.nil?
      if s
        scoresheet = s.content
      else
        scoresheet = "### Grading Notes..."
      end
      ng = Grade.create(school_id: school_id,user_id: student_id, assignment_id: assignment_id, staff_id: staff_id, scratchpad: scoresheet)
    end
    return t
  end
  
end
