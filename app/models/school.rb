class School < ActiveRecord::Base
  has_many :participants
  has_many :users, :through => :participants
  has_many :assignments
  has_many :duetimes
  has_many :templats
  has_many :scoresheets
  
  ### Attributes ############################
    attr_accessible :active, :description, :end_date, :enrolement_type, :language_id, :location
    attr_accessible :mailing_address, :name, :prereqs, :start_date, :tagline, :timezone, :version_id
    attr_accessible :caption
  ###############################
  
  # Attachments #################
  attr_accessible :logo, :header, :featured
  has_attached_file :logo, :styles => {:thumb => "100x100>" }
  has_attached_file :header, :styles => {:thumb => "100x100>" }
  has_attached_file :featured, :styles => { :medium => "275x275>", :thumb => "100x100>" }
  ###############################
  
  # Validations #################
  validates_presence_of :name
  validates_attachment :logo,
    :content_type => { :content_type => ["image/jpeg","image/png"]},
    :size => { :in => 0..1000.kilobytes }
  validates_attachment :header,
    :content_type => { :content_type => ["image/jpeg","image/png"] },
    :size => { :in => 0..1000.kilobytes }
  validates_attachment :featured,
    :content_type => { :content_type => ["image/jpeg","image/png"]},
    :size => { :in => 0..1000.kilobytes }
  ###############################
  
  # Methods #####################
  def self.all_active
    schools = School.where(active: true).all
  end

end
