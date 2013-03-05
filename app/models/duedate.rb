class Duedate < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :school
  belongs_to :team
  
  default_scope order: "duedate ASC"
  
  attr_accessible :assignment_id, :duedate, :school_id, :team_id
  
  
  
  
end
