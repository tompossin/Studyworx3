class Title < ActiveRecord::Base
  acts_as_tree :order => 'position ASC', :dependent => :destroy
  belongs_to :assignment
  belongs_to :paragraph
  belongs_to :school
  belongs_to :task
  belongs_to :user
  has_many :ppoints, :dependent => :destroy
  has_one :charttext, :dependent => :destroy
  
  default_scope order: "position ASC"
  
  
  attr_accessible :assignment_id, :paragraph_id, :parent_id, :position, :school_id, :staff_note, :task_id, :title, :title_type, :user_id, :verse_count

  # A method that populates a new chart setup.
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
  
  # Insert a new title, reorder records, and assignment hierarchy
  def insert_title(title_type=2)
    # locate the insert point id
    ip_id = self.id
    ip_position = self.position
    # Increment all records after the insert point by one to make room for the new one.
    update = Title.update_all("position = position + 1",["task_id = ? and user_id = ?",self.task_id,self.user_id])
    # Make sure the update suceeded
    unless update
      return false
    end
    # Create a new title of the proper type.
    new_title = Title.create(user_id: self.user_id, school_id: self.school_id, assignment_id: self.assignment_id, task_id: self.task_id, title: "Add Title Here",title_type: title_type, position: ip_position)
    return new_title   
  end
  
  # Clean up incoming params to help with inconsistent behavior of browsers (and users).
  def clean_input(title_content)
    content = title_content.gsub(/\s|<br>/,'') 
    if content == ""
      if self.title_type == 1
          content = self.paragraph.startref
      elsif self.title_type == 2
          content = "Enter a Segment Title"
      elsif self.title_type == 3
          content = "Enter a Section Title"
      elsif self.title_type = 4
          content = "Enter a Division Title"
      elsif self.title_type = 5
          content = "Enter a Book Title"
      end
    else
      content = title_content.gsub(/\n|<br>/,'')
    end
    return content
  end
  

end
