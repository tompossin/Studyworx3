# This handles teams management. 
# * Many other team functions are handled through messages and assignments
class Team < ActiveRecord::Base
  belongs_to :school
  has_and_belongs_to_many :users
  has_many :duedates, inverse_of: :team
  
  scope :sorted, order: "school_id,coreteam DESC"
  
  attr_accessible :description, :name, :owner_id, :school_id, :coreteam, :private
  ##########################################################
  validates_presence_of :name, :owner_id, :school_id
  
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
  
  def self.all_i_own(user)
    Team.where("owner_id = ?",user.id)
  end
  

  # Returns a collection of duedates by team and module
  # school = School.object, mod_id = assignment.module
  #  Usage: Team.find_or_create_team_duedates_by_module(@school,@team,params[:module])
  def self.find_or_create_team_duedates_by_module(school,team,mod_id)
    assignments = school.assignments.where(module: mod_id).all
    tdd_ids = []
    assignments.each do |a|
      tdd = Duedate.unscoped.where("team_id = ? and assignment_id = ?",team.id,a.id).first
      unless tdd
        ndd = Duedate.create(team_id: team.id, assignment_id: a.id, school_id: school.id)
        tdd_ids << ndd.id
      else
        tdd_ids << tdd.id
      end
    end
    duedates = Duedate.includes(:assignment).find(tdd_ids) 
  end
  
  
end
