# This handles teams management. 
# * Many other team functions are handled through messages and assignments
class Team < ActiveRecord::Base
  belongs_to :school
  has_and_belongs_to_many :users
  has_many :duedates
  
  
  attr_accessible :description, :name, :owner_id, :school_id, :coreteam
  ##########################################################
  validates_presence_of :name, :owner_id
  
  # Adds a member(user) to a team.
  #  Usage: @team.add_member(@user_object)
  # * A user can not belong to more than one coreteam in each school.
  # * A user can not belong to a team more than once.
  def add_member(user)
    already_member = self.users.exists?(user.id)
    if self.coreteam
      has_a_coreteam = user.teams.where("school_id = ? and coreteam = ?",self.school_id,true).first
    end
    unless already_member or has_a_coreteam
      self.users<<user
      return true
    else
      return false
    end
  end
  
  # Removes a user from the current team.
  def remove_member(user)
    if self.users.delete(user)
      return true
    else
      return false
    end
  end
  
end
