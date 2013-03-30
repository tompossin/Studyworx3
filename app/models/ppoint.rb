class Ppoint < ActiveRecord::Base
  belongs_to :title
  belongs_to :user
  belongs_to :observation
  
  attr_accessible :color, :content, :observation_id, :position, :staff_note, :title_id, :user_id
end
