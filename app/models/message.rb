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
            :conditions => ["((recipient_id = (?) and recipient_read = false) 
                            or (sender_id = (?) and sender_read = false)) 
                            and parent_id IS NULL",user_id,user_id],
            :distinct => true)
  end
  
  # Returns true or false if the user has unread personal messages
  def self.unviewed_personal_messages?(user_id)
    newest = self.maximum(:id, :conditions => ["((recipient_id = (?) and recipient_read = false) 
                                                or (sender_id = (?) and sender_read = false)) 
                                                and parent_id IS NULL",user_id,user_id]) 
    msg =  Lastmessage.get_personal(user_id)
    if msg
      if newest
        if msg.lastviewed and newest > msg.lastviewed
          return true
        else
          return false
        end
      else
        return false
      end
    else
      return false
    end   
  end
  
  # Returns true or false if the user has unread team messages
  def self.unviewed_team_messages?(user_id)
    user = User.find(user_id)
    teams = user.team_ids
    newest = self.maximum(:id, :conditions => ["team_id IN (?) and parent_id IS NULL",teams])
    msg = Lastmessage.get_team(user_id)
    if msg
      if newest
        if msg.lastviewed and newest > msg.lastviewed
          return true
        else
          return false
        end
      else
        return false
      end
    else
      return false
    end
  end
  
  # retrieves previously read private messages for a user.  
  def self.get_read_messages(user_id,pagesize=0,page=0)
    return Message.where("((sender_id = ? and sender_read = true) 
                          or (recipient_id = ? and recipient_read = true)) 
                          and parent_id IS NULL",
                          user_id,user_id).offset(page*pagesize).limit(pagesize)
  end
  
  # update the lastmessage table with the most recently viewed personal message id
  def self.update_personal_views(user_id)
    newest = self.maximum(:id, :conditions => ["((recipient_id = (?) and recipient_read = false) 
                                                or (sender_id = (?) and sender_read = false)) 
                                                and parent_id IS NULL",user_id,user_id])
    lm = Lastmessage.where("user_id = ? and team = ?",user_id,false).first
    unless lm
      lm = Lastmessage.create(user_id: user_id, team: false, lastviewed: newest)
    else
      if newest
        lm.lastviewed = newest
      else
        lm.lastviewed = 0
      end
      lm.save
    end
  end
  
  def self.update_team_views(user_id)
    user = User.find(user_id)
    teams = user.team_ids
    newest = self.maximum(:id, :conditions => ["team_id IN (?) and parent_id IS NULL",teams])
    lm = Lastmessage.where("user_id = ? and team = ?",user_id,true).first
    unless lm
      lm = Lastmessage.create(user_id: user_id, team: true, lastviewed: newest)
    else
      if newest
        lm.lastviewed = newest
      else
        lm.lastviewed = 0
      end
      lm.save
    end
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
