class Message < ActiveRecord::Base
  acts_as_tree :order => 'updated_at DESC', :dependent => :destroy
  
  #############################
  default_scope order: 'updated_at DESC'
  ##############################
  validates_presence_of :body
  attr_accessible :parent_id, :recipient_id, :sender_id, :school_id, :team_id, 
  :subject, :body
  ##############################
  def self.get_unread_team_messages(user)
    teams = user.teams.all
    return Message.where(team_id: teams).all
  end
  def self.get_unread_messages(user_id)
    return Message.where("((recipient_id = ? and recipient_read = ?) 
                                  or (sender_id = ? and sender_read = ?)) 
                                  and parent_id IS NULL",
                                  user_id,false,user_id,false).all
  end
  # WARNING This is safe ONLY as long as you NEVER use any user supplied data for user_id.
  def self.count_all_read_messages(user_id)
    return Message.count(
            :conditions=> "((sender_id = #{user_id} and sender_read = true) or (recipient_id = #{user_id} and recipient_read = true)) and parent_id IS NULL",
            :distinct=>true)
  end
  # WARNING This is safe ONLY as long as you NEVER use any user supplied data for user_id.
  def self.count_all_unread_messages(user_id)
    return Message.count(
            :conditions => "((recipient_id = user_id and recipient_read = false) 
                            or (sender_id = user_id and sender_read = false)) 
                            and parent_id IS NULL",
            :distinct => true)
  end
    
  def self.get_read_messages(user_id,pagesize=0,page=0)
    return Message.where("((sender_id = ? and sender_read = true) 
                          or (recipient_id = ? and recipient_read = true)) 
                          and parent_id IS NULL",
                          user_id,user_id).offset(page*pagesize).limit(pagesize)
  end
  
  def self.mark_as_read(msg_id,user_id)
    m = Message.find(msg_id)
    if m.recipient_id == user_id
      m.recipient_read = true
    end
    if m.sender_id == user_id
      m.sender_read = true
    end
    m.save
    return m
  end
  
  def self.mark_parent_as_unread(id)
    parent = Message.find(id)
    parent.sender_read = false
    parent.save
    return parent
  end
end
