class Turnin < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignment
  
  attr_accessible :assignment_id, :comment, :done, :staff_id, :user_id
  
  validates :assignment_id, presence: true
  validates :user_id, presence: true
  
  def self.find_or_create_by_student(school_id,user_id,assignment_id)
    # Check if the a turnin record exists or create one.
    t = self.where("user_id = ? and assignment_id = ?", user_id, assignment_id).first
    unless t
      t = self.create(user_id: user_id, assignment_id: assignment_id)
    end
    # Check if a matching grade exists or create one.
    g = Grade.where("user_id = ? and assignment_id = ?", user_id, assignment_id).first
    a = Assignment.find(assignment_id)
    s = Scoresheet.find(a.scoresheet_id) unless a.scoresheet_id.nil?
    if s
      scoresheet = s.content
    else
      scoresheet = "### Grading Notes..."
    end
    unless g
      ng = Grade.create(school_id: school_id,user_id: user_id, assignment_id: assignment_id, scratchpad: scoresheet)
    end
    return t
  end
  
end
