class UserAdmin < ActiveRecord::Base
  belongs_to :user
  attr_accessible :level, :user_id
  validates :user_id, uniqueness: true
  ########
  def self.search(search)
    if search
      # find(:first) and find(:all) are deprecated in favor of first() and all()
      User.all(:conditions => ['lastname LIKE ?', "%#{search}%"])
    else
      User.all(limit: 10)
    end
  end
end
