class AddColumnsToTeams < ActiveRecord::Migration
  def change
    add_index :teams, :school_id
  end
end
