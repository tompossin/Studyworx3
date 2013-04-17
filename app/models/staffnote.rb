class Staffnote < ActiveRecord::Base
  belongs_to :noteable, polymorphic: true
  
  attr_accessible :assignment_id, :content, :content_type, :noteable, :noteable_type, :user_id
end
