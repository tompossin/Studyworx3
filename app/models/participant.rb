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
  
  def remove_school_teams(user_id,school_id)
    if user_id and school_id
      leader = User.find(user_id)
      registrant = User.find(self.user_id)
      school = School.find(school_id)
      if leader and leader.is_school_admin?(school_id)
        school.teams.where("owner_id = ?",registrant.id).destroy_all
        teams = school.teams
        teams.each do |t|
          t.remove_member(registrant)
        end
      end
    else
      return false
    end
  end
  
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
  
  #typical Usage:
  # @students = @school.participants.count_students
  # returns T/F if there are any current accepted students
  def self.check_for_students
    number_of_students = self.where("role_id = ? and accepted = ?",4,2).count
    if number_of_students > 0
      return true
    else
      return false
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
  
  # Find the coreteam for the participant instance
  # This is similar to @user.coreteam only linked to a participant record not the current user school
  def coreteam
    self.user.teams.where("school_id = ? and coreteam = ?",self.school_id, true).first
  end
  
  def self.create_school_leader(user,school)
    self.create(user_id: user.id,school_id: school.id, role_id: 1, accepted: 2,prereq: true, language_id: 1)
  end

end
