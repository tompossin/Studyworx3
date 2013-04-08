class Title < ActiveRecord::Base
  acts_as_tree :order => 'position ASC', dependent: :nullify
  belongs_to :assignment
  belongs_to :paragraph
  belongs_to :school
  belongs_to :task
  belongs_to :user
  has_many :ppoints, :dependent => :destroy
  has_one :charttext, :dependent => :destroy
  
  default_scope order: "position ASC"
  
  
  attr_accessible :assignment_id, :paragraph_id, :parent_id, :position, :school_id, :staff_note, :task_id, :title, :title_type, :user_id, :verse_count

  # Check if this assignment has already been populated with paragraph refs.
  def self.is_started?(task_id,user_id)
    self.exists?(["task_id = ? and user_id = ?",task_id,user_id])
  end
  
  # A method that populates a new chart setup.
  def self.autopopulate(assignment,task,user)
    unless self.exists?(["task_id = ? and user_id = ?",task.id,user.id])
      school = School.find(assignment.school_id)
      pos = 0
      prefs = Paragraph.where("book_id = ? and version_id = ?",assignment.book_id, school.version_id).all
      prefs.each do |p|
        Title.create(user_id: user.id, school_id: school.id, assignment_id: assignment.id, task_id: task.id, paragraph_id: p.id, title_type: 1, title: p.startref, position: pos, verse_count: p.verse_count)
        pos += 1
      end
    end
    titles = Title.where("user_id = ? and task_id = ?",user.id,task.id).all
    return titles
  end
  
  # Checks if a book title exists.
  def has_book_title?
    Title.exists?(["task_id = ? and user_id = ? and title_type = ?",self.task_id,self.user_id,5])
  end
  
  # Insert a new title, reorder records, and assignment hierarchy
  def insert_title(title_type=2)
    # Check if there is already a book title
    if title_type == 5
      return false if self.has_book_title?
    end
    # Increment all records after the insert point by one to make room for the new one.
    update = Title.update_all("position = position + 1",["task_id = ? and user_id = ? and position >= ?",self.task_id,self.user_id,self.position])
    # Make sure the update suceeded
    unless update
      return false
    end
    # Create a new title of the proper type.
    new_title = Title.create(user_id: self.user_id, school_id: self.school_id, assignment_id: self.assignment_id, task_id: self.task_id, title: "Add Title Here",title_type: title_type, position: self.position)
    return new_title   
  end
  
  # Reorder titles after a deletion
  def self.reorder_after_delete(task_id,user_id,position)
    self.update_all("position = position - 1",["task_id = ? and user_id = ? and position > ?",task_id,user_id,position])
  end
  
  # Returns all segments for a task/user
  def self.get_segments(task_id,user_id)
    self.where("task_id = ? and user_id = ? and title_type = ?",task_id,user_id,2).all
  end
  
  # Find the previous title of the current titles type or return nil
  def find_previous
    Title.where("task_id = ? and user_id = ? and title_type = ? and position < ?",self.task_id,self.user_id,self.title_type,self.position).reorder("position DESC").first
  end
  
  # Find the next title of the current titles type or return nil
  def find_next
    Title.where("task_id = ? and user_id = ? and title_type = ? and position > ?",self.task_id,self.user_id,self.title_type,self.position).first
  end
  
  # This finds the children of the current title
  def find_ttl_children(next_ttl=nil)    
    unless next_ttl == nil # Check if this is the last title of this type
      ttype = self.title_type - 1 # Start looking for children one level down
      while ttype > 0 # If children exist get them, otherwise look one more level down
        if Title.exists?(["task_id = ? and user_id = ? and title_type = ?",self.task_id,self.user_id,ttype])
          return Title.where("task_id = ? and user_id = ? and title_type = ? and position < ? and position > ?",self.task_id,self.user_id,ttype,next_ttl.position,self.position).all
        end
        ttype -= 1
      end
    else # This is the last title of this type, same as above except for return query
      ttype = self.title_type - 1
      while ttype > 0
        if Title.exists?(["task_id = ? and user_id = ? and title_type = ?",self.task_id,self.user_id,ttype])
          return Title.where("task_id = ? and user_id = ? and title_type = ? and position > ?",self.task_id,self.user_id,ttype,self.position).all
        end
        ttype -= 1 
      end
    end
  end
  
  # This builds the title heirarchy and counts the verses for each parent title.
  # Iterates through the title types staring with type 2 (segments) since this is the lowest level of parent title.
  def self.build_tree(task_id,user_id)
    t_types = [2,3,4,5]
    t_types.each do |tt| 
      c_titles = self.where("task_id = ? and user_id = ? and title_type = ?",task_id,user_id,tt).all
      c_titles.each do |c|
        next_ttl = c.find_next
        t_children = c.find_ttl_children(next_ttl)
        c.children = t_children
        v_count = c.children.sum("verse_count")
        c.verse_count = v_count
        c.save
      end
    end  
  end
  
  # Clean up incoming params to help with inconsistent behavior of browsers (and users).
  # A lot of white space and a few random <br>'s sneak into the database otherwise.
  # This also corrects for people trying to save a blank string since this is a problem in Mozilla 
  # Mozilla won't let you click into an element with a blank string in it.
  # It also reloads the verse refs if people accidently blast them.
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
    return content.strip
  end
  

end
