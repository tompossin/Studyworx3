# === Participant Model
# This model is a join table between users and schools.
# * The relationship is a symetrical belongs_to :through relationship
class Participant < ActiveRecord::Base
  belongs_to :role
  belongs_to :school
  belongs_to :user
  # ------------------
  attr_accessible :accepted, :prereq, :role_id, :school_id, :user_id, :language_id
  # ===============================================================================
  
  #----------
  # :section: Participant States
  # The methods below should build collections of participants in the following states.
  #
  # These methods are typically used in the scope of a school object
  #----------

  # Typical Usage:
  #  @pending_participants = @school.participants.pending
  def self.pending
    self.where(:accepted => 0)
  end
  
  # Typical Usage:
  #  @dropped_participants = @school.participants.dropped
  def self.dropped
    self.where(:accepted => 1)
  end
  
  # Typical Usage:
  #  @enroled_participants = @school.participants.enroled
  def self.enroled
    self.where(:accepted => 2)
  end

end
