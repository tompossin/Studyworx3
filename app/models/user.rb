class User < ActiveRecord::Base
  has_one :user_admin
  has_many :participants
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
  
  # I need to bypass the usual rules when a user is a team
  # In the Controller: 
  # * I need to add user.save :validate => false when saving
  # A team is special kind of user - it can not log in
  # it can also be edited by another user.
  # * I also need to remember to assign values to :email and :encryped_password due to db rules

validates :email, uniqueness: true 
validates_presence_of :firstname
validates_presence_of :lastname
     
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :phone, :address, :bio, :team, :owner_id

end
