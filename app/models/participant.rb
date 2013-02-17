# === Participant Model
# This model is a join table between users and schools.
# * The relationship is a symetrical belongs_to :through relationship
class Participant < ActiveRecord::Base
  belongs_to :role
  belongs_to :school
  belongs_to :user
  

  # ------------------
  # :section: Data Security Section
  # This section contains validations and access declarations
  # ------------------
  attr_accessible :accepted, :prereq, :role_id, :school_id, :user_id, :language_id
  validates :school_id, :user_id, presence: true
  # ===============================================================================
  
  #----------
  # :section: Participant States
  # The methods below should build collections of participants in the following states.
  #
  # These methods are typically used in the scope of a school object
  #----------
  
  def status
     if self.accepted == 0
       "P"
     elsif self.accepted == 1
       "D"
     elsif self.accepted == 2
       "A"
     else
       "U"
     end
  end
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
