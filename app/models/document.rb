class Document < ActiveRecord::Base
  has_one :endnote, :dependent => :destroy
  belongs_to :assignment, inverse_of: :documents
  belongs_to :task, inverse_of: :documents
  belongs_to :user, inverse_of: :documents
  belongs_to :school
  has_many :staffnotes, as: :noteable, dependent: :destroy
  
  attr_accessible :assignment_id, :content, :content_type, :school_id, :task_id, :user_id, :staff_note
  
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
  
  def self.toggle_type(document_id)
    document = Document.find(document_id)
    if document.content_type == 0
      document.content_type = 1
    else
      document.content_type = 0
    end
    document.save
    return document
  end
  
  def as_file
    
  end
  
  
end
