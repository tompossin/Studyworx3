class AddFieldToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :private, :boolean, default: false
  end
end
