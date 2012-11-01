class AddIndexOnParticipantTable < ActiveRecord::Migration
  def change
    add_index :participants, :user_id
  end

end
