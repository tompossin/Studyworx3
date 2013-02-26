class Endnote < ActiveRecord::Base
  belongs_to :papers
  #belongs_to :answers
  
  attr_accessible :answer_id, :content, :paper_id
end
