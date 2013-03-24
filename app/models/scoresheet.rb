class Scoresheet < ActiveRecord::Base
  has_many :assignments
  belongs_to :school
  
  attr_accessible :content, :name, :school_id, :content_type
  
  def self.find_or_default(assignment_id)
    a = Assignment.includes(:scoresheet).find(assignment_id)
    if a.scoresheet
      content = a.scoresheet.content
    else
      content = "### Grading notes..."
    end
    return content
  end
end
