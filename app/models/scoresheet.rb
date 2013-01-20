class Scoresheet < ActiveRecord::Base
  belongs_to :school
  attr_accessible :content, :name, :school_id
end
