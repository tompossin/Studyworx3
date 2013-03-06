class Document < ActiveRecord::Base
  has_one :endnote, :dependent => :destroy
  belongs_to :assignment
  belongs_to :task
  belongs_to :user
  belongs_to :school
  
  attr_accessible :assignment_id, :content, :content_type, :school_id, :task_id, :user_id
  
  def self.find_or_create(user_id,school_id,assignment_id,task_id)
    if document = Document.where("user_id = ? and task_id = ?",user_id,task_id).first
      document
    else
      document = Document.create(user_id: user_id,school_id: school_id, assignment_id: assignment_id, task_id: task_id)
      task = Task.find(task_id)
      document.content = task.templat.content if task.templat
      document.save
      return document
    end
  end
  
  
end
