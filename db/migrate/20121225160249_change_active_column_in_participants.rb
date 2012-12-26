class ChangeActiveColumnInParticipants < ActiveRecord::Migration
  def up
    change_column :participants, :accepted, :integer, :default => "0"
    change_column :participants, :prereq, :boolean, :default => false
    change_column :participants, :role_id, :integer, :default => "10"
    change_column :user_admins, :level, :integer, :default => "0"
    add_column :users, :role, :integer
  end

  def down
    change_column :participants, :accepted, :integer
    change_column :participants, :prereq, :boolean
    change_column :participants, :role_id, :integer
    change_column :user_admins, :level, :integer
    remove_column :users, :role
  end
end
