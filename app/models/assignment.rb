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
  
  # This return true/false depending on if there is still time remaining to work
  # * Usage: @assignment.editable?(current_user)
  def editable?(user)
    timenow = Time.now.in_time_zone
    due = self.duetime(user)
    if due # If there is a duedate
      if due.duedate > timenow # duedate still in the future
        return true
      else #duedate is past
        grade = Grade.where("assignment_id = ? and user_id = ?",self.id,user.id).first
        if grade and grade.returned # If grading is finished then the student can edit again
          return true
        else # If still awaiting grading - then no editing
          return false
        end 
      end
    else # If no duedate is set
      return true
    end
  end
  
  # Clone the tasks of a given assignment into self.tasks
  def clone_tasks(clone)
    tasks = clone.tasks.all
    tasks.each do |t|
      self.tasks.create(name: t.name, templat_id: t.templat_id, percent: t.percent, help: t.help, task_type: t.task_type, position: t.position)
    end
  end

  
end
