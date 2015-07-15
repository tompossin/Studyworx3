class User < ActiveRecord::Base
  has_one :user_admin
  has_many :participants
  has_many :schools, :through => :participants
  has_many :members
  has_many :blogs
  has_many :documents
  has_many :turnins
  has_many :grades
  has_many :titles
  has_many :ppoints
  has_many :charttexts
  has_many :comments
  has_many :orders
  has_one :note
  has_one :preference
  has_and_belongs_to_many :teams
  
  #default_scope order: "lastname,firstname ASC"
  scope :order_by_lastname, order: "lastname,firstname ASC"
  scope :order_by_firstname, order: "firstname, lastname ASC"
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # Validation Rules
  validates :email, uniqueness: true 
  validates_presence_of :firstname
  validates_presence_of :lastname
  # paperclip attributes
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :wallpaper, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :iotd, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  # Paperclip validations
  # FIXME I need a Jquery checker on the image uploading page that will prevent
  # them from sending bad images in the first place. These validators work but are
  # SUPER UGLY in actual use.
  validates_attachment :avatar,
    :content_type => { :content_type => ["image/jpeg","image/png"]},
    :size => { :in => 0..1000.kilobytes }
  validates_attachment :wallpaper,
    :content_type => { :content_type => ["image/jpeg","image/png"] },
    :size => { :in => 0..1000.kilobytes }
  validates_attachment :iotd,
    :content_type => { :content_type => ["image/jpeg","image/png"]},
    :size => { :in => 0..1000.kilobytes }
     
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname 
  attr_accessible :phone, :address, :bio, :avatar, :wallpaper, :iotd, :timezone
  
  
  # Sets the current school in User
  #  Usage: @user.set_school(school_id)
  def set_school(school_id)
    p = self.participants.includes(:school).where(:school_id => school_id).first
    if p
      self.role = p.role_id 
      self.school = school_id
      self.timezone = p.school.timezone
      if self.save
        return true
      end
    else
      return false
    end   
  end
  
  # Returns full name of user
  #  Usage: @user.fullname
  def fullname
    self.firstname+" "+self.lastname
  end
  
  # Returns the fullname of the user last name first
  def fullname_lnf
    self.lastname+", "+self.firstname
  end
  
  # This finds the coreteam of the user based on the users current school.
  def coreteam
    self.teams.where("school_id = ? and coreteam = ?",self.school, true).first
  end
  
  def change_to_coreteam(new_coreteam_id)
    oldteam = self.coreteam
    if oldteam
      oldteam.remove_member(self)
    end    
    newteam = Team.find(new_coreteam_id)
    newteam.add_member(self)
  end
  
  # Returns a collection of all a users teams based on the users current school.
  def schoolteams
    self.teams.where("school_id = ?",self.school).all
  end
  
  # Calculates the current grade average for a student.
  # TODO This is still giving the wrong answer.
  def grade_average
    results = Assignment.find_by_sql(["
      SELECT (sum(grades.grade * assignments.weight)/sum(assignments.weight)) AS total
      FROM assignments
      LEFT JOIN grades ON (assignments.id = grades.assignment_id)
      WHERE assignments.school_id=? and grades.user_id=? and grades.grade >= 0
      GROUP BY grades.user_id",self.school,self.id])
    return results[0]['total'].to_i unless results.count == 0
  end
  
  def module_average(mod_num)
    results = Assignment.find_by_sql(["
      SELECT (sum(grades.grade * assignments.weight)/sum(assignments.weight)) AS total
      FROM assignments
      LEFT JOIN grades ON (assignments.id = grades.assignment_id)
      WHERE assignments.school_id=? and assignments.module=? and grades.user_id=? and grades.grade >= 0
      GROUP BY grades.user_id",self.school,mod_num,self.id])
    return results[0]['total'].to_i unless results.count == 0
  end
  
  def schools_i_own
    School.where("owner_id = ?",self.id).all
  end
  
  
  # Checks users authority to administrate schools
  # * A school admin has a participant.role_id < 3
  #  Usage: @user.is_school_admin(school_id)
  def is_school_admin?(school_id)
    if self.participants.exists?(:school_id => school_id)
      participant = self.participants.find_by_school_id(school_id)
      if participant.role_id < 3
        return true
      else
        return false 
      end
    else
      return false
    end
  end
  
  # Check if the user is the school leader
  # * A school leader has a participant.role_id < 2
  #  Usage: @user.is_school_leader(school_id)
  def is_school_leader?(school_id)
    if self.participants.exists?(:school_id => school_id)
      participant = self.participants.find_by_school_id(school_id)
        if participant.role_id < 2
          return true
        else
          return false
        end
    else
      return false
    end
  end
  
  def is_superadmin
    if self.user_admin and self.user_admin.level == 3
      true
    end
  end
  
  def is_administrator
    if self.user_admin and self.user_admin.level > 1
      true
    end
  end
  
  def is_contributor
    if self.user_admin and self.user_admin.level > 0
      true
    end
  end
  
  # Check the status of an applicant to the school
  #  Returns: participant.accepted (0,1,2) or false if they have not registered
  #
  # The meanings of the 3 values are as follows:
  # * participant.accepted == 0 pending registration
  # * participant.accepted == 1 dropped student (not active but still has access)
  # * participant.accepted == 2 accepted student (active)
  def status
    participant = Participant.where("user_id = ? and school_id = ?",self.id,self.school).first
    if participant
      return participant.accepted
    else
      return false
    end
  end
  
  # Check if this user is a student for current school
  #  Usage:  current_user.student? # returns true or false 
  def student?
    if self.role and self.role == 4 
      true
    end
  end
  
  # Check if this user is staff for current school
  #  Usage:  current_user.staff? # returns true or false 
  def staff?
    if self.role and self.role < 4 
      true
    end
  end
  
  # Check if this user is staff for current school
  #  Usage:  current_user.admin_assistant? # returns true or false
  def admin_assistant?
    if self.role and self.role < 3 
      true
    end
  end
  
  # Check if this user is staff for current school
  #  Usage:  current_user.leader? # returns true or false
  def leader?
    if self.role and self.role < 2 
      true
    end
  end
  
  # Check if the user has a private school and default team.
  # Create them if needed.
  def check_or_create_private_school
    # Check if a private school exists or create one
    unless self.schools.exists?(["private = ?",true])
      today = Time.now
      priv_school = School.new
      priv_school.private = true
      priv_school.owner_id = self.id
      priv_school.name = self.email + " - [private]"
      priv_school.timezone = "UTC"
      priv_school.start_date = today
      priv_school.end_date = today.next_year
      priv_school.version_id = 2
      priv_school.save
      # Create a participant record to make this user the school leader
      participant = self.participants.new(:school_id => priv_school.id)
      participant.role_id = 1
      participant.accepted = 2
      participant.language_id = 1
      participant.prereq = true
      participant.save
      # Create a default coreteam for the new private school
      priv_team = self.teams.new(school_id: priv_school.id)
      priv_team.coreteam = true
      priv_team.private = true
      priv_team.owner_id = self.id
      priv_team.name = "Default Team - [private]"
      priv_team.description = "This is the default team for your default school. Do not delete."
      priv_team.save
      # Make new user a member of the core team
      priv_team.add_member(self)     
      # Load book list and create assignments/tasks/duedates for each one.
      bks = Book.find(:all)
      bks.each do |b|
        a = priv_school.assignments.new
        a.school_id = priv_school.id
        a.book_id = b.id
        a.name = b.name
        a.weight = 1
        a.module = 1
        a.resources = "This is where you would list links of online resources etc."
        a.instructions = "This is where you would write instructions for this assignment"
        a.save
      end
      sa = priv_school.assignments.all
      sa.each do |a|
        # add task to each assignment
        t = a.tasks.new
        t.assignment_id = a.id
        t.name = "Chart this book"
        t.percent = 100
        t.task_type = 3
        t.position = 0
        t.help = "This is where you would write instructions for this task."
        t.save
        # add duedate to each assignment 
        d = a.duedates.new
        d.team_id = priv_team.id
        d.school_id = a.school_id
        d.assignment_id = a.id
        d.duedate = (Time.now.advance(:years => +5))
        d.save
      end
      # populate observation table
      obs = Observation.where("school_id = ?",7).all
      obs.each do |o|
        pso = priv_school.observations.new
        pso.code = o.code
        pso.name = o.name
        pso.save
      end
    end        
  end
  
  # Returns a string of the users administrative Status
  #  Usage: current_user.admin_status 
  # * user_admin.level == 1 returns "Contributor"
  # * user_admin.level == 2 returns "Administrator"
  # * user_admin.level == 3 returns "Super-Admin"
  # * user_admin.level == nil returns "Undefined"
  def admin_status
    if self.user_admin
      if self.user_admin.level == 1
        return "Contributor"
      elsif self.user_admin.level == 2
        return "Administrator"
      elsif self.user_admin.level == 3
        return "Super-Admin"
      else
        return "Undefined"
      end  
    else
      return "Undefined" 
    end
  end

end
