class Version < ActiveRecord::Base
  has_many :paragraphs
  
  attr_accessible :name
  
  validates :name, uniqueness: true
  validates :name, presence: true
  
  def destroy_if_no_dependents
    self.destroy unless self.paragraphs.exists?
  end
  
end
