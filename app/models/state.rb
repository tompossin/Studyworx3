class State < ActiveRecord::Base
  attr_accessible :uptodate, :user_id
  
  def self.update_state(user_id)
    state = self.find_or_create_by_user_id(user_id)
    if state.uptodate
      state.uptodate = false
      state.save
    end
  end
  
  def self.reset_state(user_id)
    state = self.find_by_user_id(user_id)
    unless state.uptodate
      state.uptodate = true
      state.save
    end
  end
  
end
