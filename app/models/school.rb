class School < ActiveRecord::Base
  has_many :participants, :dependent => :destroy
  has_many :users, :through => :participants
  has_many :assignments, :dependent => :destroy
  has_many :duedates, :dependent => :destroy
  has_many :templats, :dependent => :destroy
  has_many :scoresheets, :dependent => :destroy
  has_many :teams
  has_many :documents
  
  ### Attributes ############################
    attr_accessible :active, :description, :end_date, :enrolement_type, :language_id, :location
    attr_accessible :mailing_address, :name, :prereqs, :start_date, :tagline, :timezone, :version_id
    attr_accessible :caption
  ###############################
  
  # Attachments #################
  attr_accessible :logo, :header, :featured
  has_attached_file :logo, :styles => {:thumb => "100x100>" }
  has_attached_file :header, :styles => {:thumb => "100x100>" }
  has_attached_file :featured, :styles => { :medium => "275x275>", :thumb => "100x100>" }
  ###############################
  
  # Validations #################
  validates_presence_of :name
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
  # Returns all active schools
  def self.all_active
    schools = School.where(active: true).all
  end
  
  # Returns all current assignments
  def current_assignments(user)
    team = user.teams.where("school_id = ? and coreteam = ?",user.school,true).first
    if team
      assignments = self.assignments.includes([:duedates]).where( "duedates.duedate > ? and team_id = ?", Time.now.in_time_zone,team).order("duedates.duedate ASC")
    end
  end

end
