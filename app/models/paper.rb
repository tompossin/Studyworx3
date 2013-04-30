class Paper < ActiveRecord::Base
  has_many :reviews
  belongs_to :user 
  has_one :endnote
  
  attr_accessible :tags, :author , :content, :synopsis, :title, :user_id
end
