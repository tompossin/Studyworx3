class UserAdmin < ActiveRecord::Base
  belongs_to :user
  attr_accessible :level, :user_id
  validates :user_id, uniqueness: true
  ########
  def self.search(search)
    if search
      User.find(:all, :conditions => ['lastname LIKE ?', "%#{search}%"])
    else
      User.find(:all)
    end
  end
end
