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
  

  # Returns a collection of duedates by team and module
  # school = School.object, mod_id = assignment.module
  #  Usage: @team.find_or_create_team_duedates_by_module(@school,params[:module])
  def find_or_create_team_duedates_by_module(school,mod_id)
    assignments = school.assignments.where(module: mod_id).all
    tdd_ids = []
    assignments.each do |a|
      tdd = self.duedates.unscoped.find_by_assignment_id(a.id)
      unless tdd
        ndd = self.duedates.create(assignment_id: a.id,team_id: self.id, school_id: school.id)
        tdd_ids << ndd.id
      else
        tdd_ids << tdd.id
      end
    end
    duedates = Duedate.find(tdd_ids) 
  end
  
  
end
