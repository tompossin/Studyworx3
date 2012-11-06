class Participant < ActiveRecord::Base
  belongs_to :role
  belongs_to :school
  belongs_to :users
  has_and_belongs_to_many :teams
  attr_accessible :accepted, :avatar, :language_id, :prereq, :role_id, :school_id, :theme, :user_id, :wallpaper
end
