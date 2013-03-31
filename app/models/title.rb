class Title < ActiveRecord::Base
  acts_as_tree :order => 'position ASC', :dependent => :destroy
  belongs_to :assignment
  belongs_to :paragraph
  belongs_to :school
  belongs_to :task
  belongs_to :user
  has_many :ppoints, :dependent => :destroy
  has_one :charttext, :dependent => :destroy
  
  
  attr_accessible :assignment_id, :paragraph_id, :parent_id, :position, :school_id, :staff_note, :task_id, :title, :title_type, :user_id, :verse_count

  # TODO I need to build a method that populates a new chart setup
  # TODO Need to fix the indexes on this table so it does not suck.
  def self.find_or_autopopulate(assignment,task,user)
    title_count = self.count(:all, conditions: ["user_id = ? and assignment_id = ?",user.id, task.assignment_id])
    unless title_count > 0
      school = School.find(assignment.school_id)
      pos = 0
      prefs = Paragraph.where("book_id = ? and version_id = ?",assignment.book_id, school.version_id).all
      prefs.each do |p|
        Title.create(user_id: user.id, school_id: school.id, assignment_id: assignment.id, task_id: task.id, paragraph_id: p.id, title_type: 1, title: p.startref, position: pos, verse_count: p.verse_count)
        pos += 1
      end
    end
    titles = Title.where("user_id = ? and task_id = ?",user.id,task.id).all
  end
  
  # TODO I need to build a destroyer so people can start over

end
