class Book < ActiveRecord::Base
  belongs_to :version
  has_many :paragraphs
  
  default_scope order: "position ASC"
  
  attr_accessible :name, :short_name, :verse_count
  
  validates :name, presence: true, uniqueness: true
  validates :short_name, presence: true, uniqueness: true
  validates :verse_count, presence: true, numericality: true
  
  def destroy_if_no_dependents
    self.destroy unless self.paragraphs.exists?
  end
  
end
