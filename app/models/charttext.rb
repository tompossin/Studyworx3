class Charttext < ActiveRecord::Base
  belongs_to :title
  belongs_to :user
  has_many :staffnotes, as: :noteable, dependent: :destroy
  
  attr_accessible :content, :content_type, :staff_note, :title_id, :user_id
end
