class Assignment < ActiveRecord::Base
  has_many :duedates, :dependent => :destroy
  has_many :tasks, :dependent => :destroy, inverse_of: :assignment
  has_many :documents, inverse_of: :assignment
  has_many :turnins, inverse_of: :assignment
  has_many :grades, inverse_of: :assignment
  has_many :titles, inverse_of: :assignment
  belongs_to :scoresheet, inverse_of: :assignments
  belongs_to :school, inverse_of: :assignments
  acts_as_list
  
  default_scope order: 'module ASC'
  
  attr_accessible :book_id, :instructions, :module, :name, :position, :resources, :school_id, :scoresheet_id, :weight
  
  # Validations for Assignments
  validates :name, :module, :school_id, :weight, :instructions, presence: true
  validates :weight, :module, :inclusion => {:in => 0..100}
  
  # Get the duetime for the current assignment
  def duetime(user)
    team = user.teams.where("coreteam = ?",true).first
    duetime = Duedate.where("team_id = ? and assignment_id = ?",team.id,self.id).first
    if team and duetime
      return duetime
    else
      return false
    end
  end

  
end
