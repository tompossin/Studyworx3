class State < ActiveRecord::Base
  attr_accessible :uptodate, :user_id, :task_id
  
  # This checks for the state and creates or updates as needed
  # The if state.update check is needed to prevent unneeded updates
  def self.update_state(user_id,task_id)
    state = self.where("user_id = ? and task_id = ?",user_id,task_id).first
    unless state
      state = State.create(user_id: user_id, task_id: task_id, uptodate: false)
    else
      if state.uptodate
        state.uptodate = false
        state.save
      end
    end
    return state
  end
  
  # This updates the state to "uptodate" after charts are rebuilt.
  def self.reset_state(user_id,task_id)
    state = self.where("user_id = ? and task_id = ?",user_id,task_id).first
    unless state.uptodate
      state.uptodate = true
      state.save
    end
  end
  
end
