class CreateUsersTeamsTable < ActiveRecord::Migration
  def up
    create_table(:teams_users, id: false) do |t|
      t.integer :user_id
      t.integer :team_id
    end
    add_index :teams_users, [:user_id, :team_id]
  end

  def down
    drop_table(:teams_users)
  end
end
