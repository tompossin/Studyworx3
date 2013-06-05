class Duedate < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :school
  belongs_to :team, inverse_of: :duedate
  has_many :grades
  
  default_scope order: "duedate ASC"
  
  attr_accessible :assignment_id, :duedate, :school_id, :team_id
  
  # Load duedate object from user.coreteam
  def self.find_by_user_and_assignment(user_id,assignment_id)
    user = User.find(user_id)
    team = user.coreteam
    if team
      return self.where("team_id = ? and assignment_id = ?",team.id,assignment_id).first
    else
      return false
    end    
  end
  
  
end
