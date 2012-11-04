class School < ActiveRecord::Base
  has_many :participants
  ###############################
    attr_accessible :active, :description, :end_date, :enrolement_type, :language_id, :location, :mailing_address, :name, :prereqs, :start_date, :tagline, :timezone, :version_id
  ###############################
  
end
