class Role < ActiveRecord::Base
  has_many :participants
  attr_accessible :rolename
end
