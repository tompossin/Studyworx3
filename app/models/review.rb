class Review < ActiveRecord::Base
  belongs_to :paper
  belongs_to :user
  
  #############################
  default_scope order: 'updated_at DESC'
  ##############################
  
  attr_accessible :content, :paper_id, :user_id, :approved
  
  
end
