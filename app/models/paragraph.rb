class Paragraph < ActiveRecord::Base
  has_many :titles
  belongs_to :book
  belongs_to :version

  default_scope order('position ASC')

  attr_accessible :book_id, :content, :endref, :position, :startref, :verse_count, :version_id

  def insert_above(user)
    update = Paragraph.update_all("position = position + 1",["book_id = ? and version_id = ? and position >= ?",self.book_id,self.version_id,self.position])
    unless update
      return false
    end
    p = Paragraph.create(book_id: self.book_id, content: user.firstname, version_id: self.version_id,position: self.position,verse_count: 1)
    return p
  end

  def reorder_after_delete
    Paragraph.update_all("position = position - 1",["book_id = ? and version_id = ? and position >= ?",self.book_id,self.version_id,self.position])
  end

  def next_position
    last = Paragraph.unscoped.where("book_id = ? and version_id = ?",self.book_id,self.version_id).last
    if last
      self.position = last.position + 1
    else
      self.position = 0
    end
  end

end
