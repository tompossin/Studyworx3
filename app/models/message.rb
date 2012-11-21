class Message < ActiveRecord::Base
  acts_as_tree :order => 'created_at', :dependant => :destroy
  
  #############################
  # Methods to suck up user info for sender and recipient
  def sender
    user = User.find(self.sender_id)
    return user
  end
  def recipient
    user = User.find(self.recipient_id)
    return user
  end
  
  ##############################
  
  validates_presence_of :body
  attr_accessible :archived, :body, :has_read, :parent_id, :recipient_id, :recipient_trashed, :school_id, :sender_id, :sender_trashed, :subject
end
