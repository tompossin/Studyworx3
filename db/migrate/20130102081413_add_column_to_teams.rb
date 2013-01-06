class AddColumnToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :coreteam, :boolean
    add_index :teams, :coreteam
    add_index :teams, :owner_id
  end
end
