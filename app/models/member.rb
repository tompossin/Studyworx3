class Member < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :member_id, :user_id
end
