class Paper < ActiveRecord::Base
  has_many :reviews
  belongs_to :user 
  has_one :endnote, dependent: :destroy
  
  attr_accessible :tags, :author , :content, :synopsis, :title, :user_id, :draft, :published
  
  def self.all_drafts
    self.where("draft = ?",true).all
  end
  
  def self.all_published
    self.where("published = ?",true).all
  end
  
  def tally_votes
    self.reviews.where("approved = ?", true).count
  end
  
end
