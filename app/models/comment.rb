class Comment < ActiveRecord::Base
  acts_as_tree :order => 'updated_at DESC', :dependent => :destroy
  belongs_to :user
  belongs_to :task, inverse_of: :comments
  has_many :staffnotes, as: :noteable, dependent: :destroy

  default_scope order: 'updated_at DESC'
  
  attr_accessible :comments_count, :content, :parent_id, :task_id, :user_id
end
