class Participant < ActiveRecord::Base
  has_one :role
  belongs_to :school
  belongs_to :users
  attr_accessible :accepted, :avatar, :language_id, :prereq, :role_id, :school_id, :theme, :user_id, :wallpaper
end
