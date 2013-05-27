class Lastmessage < ActiveRecord::Base
  attr_accessible :lastviewed, :user_id, :team
  
  # retrieve the last viewed personal message id for the user
  def self.get_personal(user_id)
    self.where("user_id = ? and team = ?",user_id,false).first
  end
  
  def self.get_team(user_id)
    self.where("user_id = ? and team = ?",user_id,true).first
  end
  
end
