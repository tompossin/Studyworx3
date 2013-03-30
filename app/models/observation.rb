class Observation < ActiveRecord::Base
  attr_accessible :code, :color, :link, :name, :position, :public, :school_id
end
