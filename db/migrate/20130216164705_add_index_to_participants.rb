class AddIndexToParticipants < ActiveRecord::Migration
  def change
    add_index :participants, [:school_id,:role_id]
  end
end
