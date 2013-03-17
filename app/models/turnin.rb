class Turnin < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignment
  
  attr_accessible :assignment_id, :comment, :done, :staff_id, :user_id
  
  validates :assignment_id, presence: true
  validates :user_id, presence: true
  
end
