class Preference < ActiveRecord::Base
  belongs_to :user

  attr_accessible :bgcolor, :rows, :theme, :user_id
  
end
