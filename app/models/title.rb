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
  
  # TODO I need to build a destroyer so people can start over

end
