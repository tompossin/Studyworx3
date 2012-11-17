class User < ActiveRecord::Base
  has_one :user_admin
  has_many :participants
  has_many :blogs
  has_one :note
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  # Validation Rules
  validates :email, uniqueness: true
  validates_presence_of :firstname
  validates_presence_of :lastname
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :phone, :address, :bio
  

end
