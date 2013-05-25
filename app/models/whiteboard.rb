class Whiteboard < ActiveRecord::Base
  belongs_to :school
  
  attr_accessible :content, :content_type, :school_id, :user_id
end
