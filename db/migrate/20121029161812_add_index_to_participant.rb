class AddIndexToParticipant < ActiveRecord::Migration
  def change
    add_index :participants, :school_id
  end
end
