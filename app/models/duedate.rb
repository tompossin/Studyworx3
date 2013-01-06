class Duedate < ActiveRecord::Base
  belongs_to :team
  belongs_to :assignment
  belongs_to :school
  
  attr_accessible :assignment_id, :due_date, :school_id, :team_id
end
