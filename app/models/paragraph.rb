class Paragraph < ActiveRecord::Base
  belongs_to :book
  belongs_to :version
  
  default_scope order('position ASC')
  
  attr_accessible :book_id, :endref, :position, :startref, :verse_count, :version_id
end
