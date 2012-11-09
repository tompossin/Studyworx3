class Paper < ActiveRecord::Base
  has_many :reviews
  belongs_to :user 
  
  attr_accessible :body, :synopsis, :title, :user_id
end
