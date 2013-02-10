class Message < ActiveRecord::Base
  acts_as_tree :order => 'updated_at DESC', :dependent => :destroy
  
  #############################
  default_scope order: 'updated_at DESC'
  ##############################
  validates_presence_of :body
  attr_accessible :parent_id, :recipient_id, :sender_id, :school_id, :team_id, 
  :subject, :body
  ##############################
  
  # This returns all the team messages for a user.
  #
  # Paging can be added by supplying the pagesize and page params.
  def self.get_team_messages(user,pagesize=0,page=0)
    teams = user.team_ids
    return Message.where("team_id IN (?) and parent_id IS NULL",
                                    teams).offset(page*pagesize).limit(pagesize)
  end
  
  # Gives a total Team Message count for a user.
  def self.count_team_messages(user)
    teams = user.team_ids
    return Message.count(:conditions =>[ "team_id IN (?) and parent_id IS NULL",teams])
  end
  
  def self.get_unread_messages(user_id)
    return Message.where("((recipient_id = ? and recipient_read = ?) 
                                  or (sender_id = ? and sender_read = ?)) 
                                  and parent_id IS NULL",
                                  user_id,false,user_id,false).all
  end
  
  # Counts all the personal read messages.
  def self.count_all_read_messages(user_id)
    return Message.count(
            :conditions=> ["((sender_id = (?) and sender_read = true) 
                            or (recipient_id = (?) and recipient_read = true)) 
                            and parent_id IS NULL",user_id,user_id],
            :distinct=>true)
  end
  
  # counts all the unread personal messages
  def self.count_all_unread_messages(user_id)
    return Message.count(
            :conditions => ["((recipient_id = (?) and rcipient_read = false) 
                            or (sender_id = (?) and sender_read = false)) 
                            and parent_id IS NULL",user_id,user_id],
            :distinct => true)
  end
  
  # retrieves previously read private messages for a user.  
  def self.get_read_messages(user_id,pagesize=0,page=0)
    return Message.where("((sender_id = ? and sender_read = true) 
                          or (recipient_id = ? and recipient_read = true)) 
                          and parent_id IS NULL",
                          user_id,user_id).offset(page*pagesize).limit(pagesize)
  end
  
  # Toggles a message as being read.
  def self.toggle_read_values(msg_id,user_id)
    m = Message.find(msg_id)
    if m.recipient_id == user_id
      if m.recipient_read == false
        m.recipient_read = true
      else
        m.recipient_read = false
      end
    end
    if m.sender_id == user_id
      if m.sender_read == false
        m.sender_read = true
      else
        m.sender_read = false
      end
    end
    m.save
    return m
  end
  
  # Marks a messages parent as unread.
  # This puts previously read messages back in the unread list
  # when a new reply is made.
  def self.mark_parent_as_unread(id)
    parent = Message.find(id)
    parent.sender_read = false
    parent.save
    return parent
  end
end
