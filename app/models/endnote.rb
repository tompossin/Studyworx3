class Endnote < ActiveRecord::Base
  belongs_to :document
  belongs_to :paper
  
  attr_accessible :content, :content_type, :document_id, :paper_id
  
  
end
