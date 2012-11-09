class Review < ActiveRecord::Base
  belongs_to :paper
  belongs_to :user
  
  attr_accessible :content, :paper_id, :user_id, :approved
end
