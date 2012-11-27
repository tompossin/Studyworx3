class Participant < ActiveRecord::Base
  belongs_to :role
  belongs_to :school
  belongs_to :user
  attr_accessible :accepted, :language_id, :prereq, :role_id, :school_id, :user_id

end
