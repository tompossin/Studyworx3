class Role < ActiveRecord::Base
  belongs_to :participants
  attr_accessible :rolename
end
