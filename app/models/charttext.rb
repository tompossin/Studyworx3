class Charttext < ActiveRecord::Base
  belongs_to :title
  belongs_to :user
  
  attr_accessible :content, :content_type, :staff_note, :title_id, :user_id
end
