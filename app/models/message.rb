class Message < ActiveRecord::Base
  acts_as_tree :order => 'updated_at DESC', :dependent => :destroy
  
  #############################
  default_scope order: 'updated_at DESC'
  ##############################
  validates_presence_of :body
  attr_accessible :parent_id, :recipient_id, :sender_id, :school_id, :team_id, 
  :subject, :body
  ##############################
  def self.get_personal_messages(user_id)
    return Message.where("((recipient_id = ? and recipient_read = ?) 
                                  or (sender_id = ? and sender_read = ?)) 
                                  and parent_id IS NULL",
                                  user_id,false,user_id,false).all
  end
  
  def self.get_read_personal_messages(user_id)
    m = Message.where("(sender_id = ? or recipient_id = ?) 
                          and parent_id IS NULL",
                          user_id,user_id).all
    return m
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
