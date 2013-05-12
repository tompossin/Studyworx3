class Preference < ActiveRecord::Base
  belongs_to :user

  attr_accessible :bgcolor, :hlcolor, :rows, :theme, :user_id, :wallpaper
  

  
end
