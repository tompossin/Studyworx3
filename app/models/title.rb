class Title < ActiveRecord::Base
  #acts_as_tree :order => 'position',:name_column => 'title_type', dependent: :nullify
  belongs_to :assignment
  belongs_to :paragraph
  belongs_to :school
  belongs_to :task
  belongs_to :user
  has_many :ppoints, :dependent => :destroy
  has_many :staffnotes, as: :noteable, dependent: :destroy
  has_one :charttext, :dependent => :destroy
  
  default_scope order: "position ASC"
  
  
  attr_accessible :assignment_id, :paragraph_id, :parent_id, :position, :segnum, :school_id, :staff_note, :task_id, :title, :title_type, :user_id, :verse_count

  # Check if this assignment has already been populated with paragraph refs.
  def self.is_started?(task_id,user_id)
    self.exists?(["task_id = ? and user_id = ?",task_id,user_id])
  end
  
  # A method that populates a new chart setup.
  def self.autopopulate(assignment,task,user)
    unless self.exists?(["task_id = ? and user_id = ?",task.id,user.id])
      school = School.find(assignment.school_id)
      pos = 0
      Title.create(user_id: user.id, school_id: school.id, assignment_id: assignment.id,task_id: task.id,title_type: 5, title: "Book title required", position: pos)
      pos = 1
      Title.create(user_id: user.id, school_id: school.id, assignment_id: assignment.id,task_id: task.id,title_type: 2, title: "One seg minimum", position: pos)
      pos = 2
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
  
  def get_book_title
    @title = Title.where("task_id = ? and user_id = ? and title_type = ?", self.task_id,self.user_id,5).first
    unless @title
      @title = Title.new(title: "No title")
    end
    return @title.title
  end
  
  # This replaces the method from closure_tree.
  # It returns the children of a segment title (title_type == 2)
  def children
    Title.where("parent_id = ?", self.id).all
  end
  
  def self.charts_ready?(task_id,user_id)
    result = true
    unless Title.exists?(["task_id = ? and user_id = ? and title_type = ?",task_id,user_id,1])
      result = false
    end
    unless Title.exists?(["task_id = ? and user_id = ? and title_type = ?",task_id,user_id,2])
      result = false
    end
    unless Title.exists?(["task_id = ? and user_id = ? and title_type = ?",task_id,user_id,5])
      result = false
    end
    return result
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
  
  # Returns all segment titles with related PTs PPs and CTs
  def self.get_vertical_charts(task_id, user_id)
    self.includes(:ppoints,:charttext).where("task_id = ? and user_id = ? and title_type = ?",task_id,user_id,2).all
  end
  
  def self.count_segments(task_id,user_id)
    self.where("task_id = ? and user_id = ? and title_type = ?",task_id,user_id,2).count
  end
  
  # Find the previous title of the current titles type or return nil
  def find_previous
    Title.where("task_id = ? and user_id = ? and title_type = ? and position < ?",self.task_id,self.user_id,self.title_type,self.position).reorder("position DESC").first
  end
  
  # Find the next title of the current titles type or return nil
  def find_next
    Title.where("task_id = ? and user_id = ? and title_type = ? and position > ?",self.task_id,self.user_id,self.title_type,self.position).first
  end
  
  # Build a title collection based on book size
  def self.build_horizontal_collection(task_id,user_id)
    segment_count = Title.count_segments(task_id,user_id)
    if segment_count > 7
      Title.where("task_id = ? and user_id = ? and title_type > ?",task_id,user_id,1).all
    else
      Title.where("task_id = ? and user_id = ?",task_id,user_id).all
    end
  end
  
  # This calculates the number of verses in each upper level title.
  # This must be run after any change to the title editing page.
  # It prepares the data set for building the charting images.
  def self.build_tree(task_id,user_id)
    t_types = [2,3,4,5]
    t_types.each do |tt|
      current_titles = self.where("task_id = ? and user_id = ? and title_type = ?",task_id,user_id,tt).all
      segnum = 1 if tt == 2
      current_titles.each do |ct|
        next_ttl = ct.find_next
        if next_ttl
          ct.verse_count = Title.where("task_id = ? and user_id = ? and title_type = ? and position > ? and position < ?",task_id,user_id,1,ct.position,next_ttl.position).sum("verse_count")
          if ct.title_type == 2
            Title.where("task_id = ? and user_id = ? and title_type = ? and position > ? and position < ?",task_id,user_id,1,ct.position,next_ttl.position).update_all(parent_id: ct.id)
          end
        else
          ct.verse_count = Title.where("task_id = ? and user_id = ? and title_type = ? and position > ?",task_id,user_id,1,ct.position).sum("verse_count")
          if ct.title_type == 2
            Title.where("task_id = ? and user_id = ? and title_type = ? and position > ?",task_id,user_id,1,ct.position).update_all(parent_id: ct.id)
          end
        end
        ct.segnum = segnum if ct.title_type == 2
        ct.save
        segnum += 1 if ct.title_type == 2
      end
    end
    State.reset_state(user_id, task_id)
  end
  
  # Clean up incoming params to help with inconsistent behavior of browsers (and users).
  # A lot of white space and a few random <br>'s sneak into the database otherwise.
  # This also corrects for people trying to save a blank string since this is a problem in Mozilla 
  # Mozilla won't let you click into an element with a blank string in it.
  # It also reloads the verse refs if people accidently blast them.
  # TODO add &nbsp; to the gsub below and test
  def clean_input(title_content)
    content = title_content.gsub(/\s|<br>|&nbsp;/,'') 
    if content == ""
      if self.title_type == 1
          content = self.paragraph.startref
      elsif self.title_type == 2
          content = "Segment Title"
      elsif self.title_type == 3
          content = "Section Title"
      elsif self.title_type = 4
          content = "Division Title"
      elsif self.title_type = 5
          content = "Book Title"
      end
    else
      content = title_content.gsub(/\n|<br>|&nbsp;/,'')
    end
    return content.strip
  end
  

end
