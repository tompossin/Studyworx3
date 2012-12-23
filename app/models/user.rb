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
  def set_school(school_id)
    self.school = school_id
    self.save  
  end
  
  # Returns full name of user
  def fullname
    return self.firstname+" "+self.lastname
  end
  
  # Checks users authority to administrate schools
  def is_school_admin(school_id=false)
    participant = self.participants.find_by_school_id(school_id) if school_id
    if self.user_admin
      if self.user_admin.level > 2
        return true
      end
    elsif self.school == school_id and participant.role_id < 3
      return true
    else
      return false 
    end
  end
  
  def is_school_leader(school_id)
    participant = self.participants.find_by_school_id(school_id)
    if participant
      if self.school == school_id and participant.role_id < 3
        return true
      end
    else
      return false
    end
  end

end
