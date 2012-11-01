class Blog < ActiveRecord::Base
  belongs_to :users
  attr_accessible :article, :category, :excerpt, :topic, :user_id, :featured
  
end
