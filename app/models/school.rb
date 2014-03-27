class School < ActiveRecord::Base
  has_many :participants, :dependent => :destroy
  has_many :users, :through => :participants
  has_many :assignments, :dependent => :destroy
  has_many :duedates, :dependent => :destroy
  has_many :templats, :dependent => :destroy
  has_many :scoresheets, :dependent => :destroy
  has_many :teams, :dependent => :destroy
  has_many :documents, :dependent => :destroy
  has_many :grades, :dependent => :destroy
  has_many :titles, :dependent => :destroy
  has_many :observations, :dependent => :destroy
  has_one :whiteboard, :dependent => :destroy
  
  ### Attributes ############################
    attr_accessible :owner_id, :active, :description, :end_date, :language_id, :location
    attr_accessible :mailing_address, :name, :prereqs, :start_date, :tagline, :timezone, :version_id
    attr_accessible :caption, :email, :private
  ###############################
  
  # Attachments #################
  attr_accessible :logo, :header, :featured
  has_attached_file :logo, :styles => {:thumb => "100x100>" }
  has_attached_file :header, :styles => {:thumb => "100x100>" }
  has_attached_file :featured, :styles => { :medium => "275x275>", :thumb => "100x100>" }
  ###############################
  
  # Validations #################
  validates_presence_of :owner_id, :name, :timezone, :start_date, :end_date
  validates :name, uniqueness: true
  validates_attachment :logo,
    :content_type => { :content_type => ["image/jpeg","image/png"]},
    :size => { :in => 0..1000.kilobytes }
  validates_attachment :header,
    :content_type => { :content_type => ["image/jpeg","image/png"] },
    :size => { :in => 0..1000.kilobytes }
  validates_attachment :featured,
    :content_type => { :content_type => ["image/jpeg","image/png"]},
    :size => { :in => 0..1000.kilobytes }
  ###############################
  
  # -----------
  # :section: Available Methods
  # -----------
  
  # Returns all school staff
  def staff
    staff = self.users.where("participants.role_id < 4").all
    return staff
  end
  
  # Returns all accepted students
  def students
    students = self.users.where("participants.role_id = 4 and accepted = 2").order('lastname').all
    return students
  end
  
  def coreteams
    self.teams.where("coreteam = ?",true).all
  end
  
  # Returns all active schools
  def self.all_active
    schools = School.where(active: true).all
  end
  
  # Returns all current assignments for coreteam members (students)
  def current_assignments(user)
    team = user.teams.where("school_id = ? and coreteam = ?",user.school,true).first
    if team
      assignments = self.assignments.includes([:duedates]).where( "duedates.duedate > ? and team_id = ?", Time.now.in_time_zone,team).order("duedates.duedate ASC")
    end
  end
  
  # Returns all assignments for coreteam members (students)
  def all_assignments(user)
    team = user.teams.where("school_id = ? and coreteam = ?",user.school,true).first
    if team
      assignments = self.assignments.includes([:duedates]).where( "team_id = ?",team).order("duedates.duedate ASC")
    end
  end
  
  # Returns all curent assignments by coreteam (staff basically)
  def current_team_assignments(team_id)
    assignments = self.assignments.includes([:duedates]).where("duedates.duedate > ? and team_id = ?",Time.now.in_time_zone, team_id).order("duedates.duedate ASC")   
  end
  
  # Returns all assignments by coreteam (Staff team selector)
  def all_team_assignments(team_id)
    assignments = self.assignments.includes([:duedates]).where("team_id = ?", team_id).order("duedates.duedate ASC")   
  end
  
  # Clone the assignments, tasks, templates, scoresheets, and observations of a given school
  def clone_school(school)
    # Clone assignments and tasks
    assignments = school.assignments.all
    assignments.each do |a|
      sa = self.assignments.create(name: a.name, book_id: a.book_id, scoresheet_id: a.scoresheet, weight: a.weight, module: a.module, resources: a.resources, instructions: a.instructions)
      tasks = a.tasks.all
      tasks.each do |t|
        sa.tasks.create(name: t.name, percent: t.percent, help: t.help, task_type: t.task_type, position: t.position)
      end
    end
    # Clone scoresheets
    scoresheets = school.scoresheets.all
    scoresheets.each do |s|
      self.scoresheets.create(name: s.name, content: s.content, content_type: s.content_type)
    end
    # Clone Templates (misspelling is intentional)
    templats = school.templats.all
    templats.each do |t|
      self.templats.create(name: t.name, content: t.content, content_type: t.content_type, public: t.public)
    end
    # Clone Observations
    observations = school.observations.all
    observations.each do |o|
      self.observations.create(name: o.name, code: o.code, position: o.position, public: o.public)
    end  
  end
  
  # Creates a participant record for the creator of the school
  def create_leader(user)
    participant = Participant.new(school_id: self.id, user_id: user.id)
    participant.role_id = 1
    participant.accepted = 2
    participant.prereq = true
    participant.save
  end

end
