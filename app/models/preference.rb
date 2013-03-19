class Preference < ActiveRecord::Base
  belongs_to :user

  attr_accessible :bgcolor, :rows, :theme_id, :user_id
  
end
