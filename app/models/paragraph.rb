class Paragraph < ActiveRecord::Base
  belongs_to :book
  belongs_to :version
  
  default_scope order('p_order ASC')
  
  attr_accessible :book_id, :endref, :p_order, :startref, :verse_count, :version_id
end
