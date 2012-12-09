class School < ActiveRecord::Base
  has_many :participants
  has_many :users, :through => :participants
  ###############################
    attr_accessible :active, :description, :end_date, :enrolement_type, :language_id, :location, :mailing_address, :name, :prereqs, :start_date, :tagline, :timezone, :version_id
  ###############################
  validates_presence_of :name
  
  def self.all_active
    schools = School.where(active: true).all
  end

end
