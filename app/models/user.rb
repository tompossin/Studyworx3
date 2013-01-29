class User < ActiveRecord::Base
  has_one :user_admin
  has_many :participants
  has_many :schools,:through => :participants
  has_many :members
  has_many :blogs
  has_one :note
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
  attr_accessible :phone, :address, :bio, :avatar, :wallpaper, :iotd
  
  # Sets the current school in User
  #  Usage: @user.set_school(school_id)
  def set_school(school_id)
    p = self.participants.where(:school_id => school_id).first
    if p
      self.role = p.role_id 
      self.school = school_id
      self.save
    else
      return false
    end   
  end
  
  # Returns full name of user
  #  Useage: @user.fullname
  def fullname
    return self.firstname+" "+self.lastname
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
  
  def status
    participant = Participant.where("user_id = ? and school_id = ?",self.id,self.school).first
    if participant
      return participant.accepted
    else
      return false
    end
  end
  
  def staff?
    if self.role < 4
      return true || false
    end
  end
  
  def admin_assistant?
    if self.role < 3
      return true || false
    end
  end
  
  def leader?
    if self.role < 2
      return true || false
    end
  end

end
