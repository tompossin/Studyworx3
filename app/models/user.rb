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
  has_one :note
  has_one :preference
  has_and_belongs_to_many :teams
  
  
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
  
  def coreteam
    self.teams.where("school_id = ? and coreteam = ?",self.school, true).first
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
  
  def is_administrator
    if self.user_admin.level > 1
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
