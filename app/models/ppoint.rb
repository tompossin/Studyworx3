class Ppoint < ActiveRecord::Base
  belongs_to :title
  belongs_to :user
  belongs_to :observation
  
  attr_accessible :color, :content, :observation_id, :position, :staff_note, :title_id, :user_id
  
  validates :color, :title_id, :user_id, presence: true
  
  def merged_content
    object = self.observation
    if object
      content = self.observation.code+" "+self.content
    else
      content = self.content
    end
    return content
  end
  
end
