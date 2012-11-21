class AddTeamColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :team, :boolean, :default => false
    add_column :users, :owner_id, :integer, :default => nil
    add_index :users, :team
    add_index :users, :owner_id
  end
end
