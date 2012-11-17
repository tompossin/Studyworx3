class Note < ActiveRecord::Base
  belongs_to :user 
  
  attr_accessible :public, :reminder, :user_id
end
