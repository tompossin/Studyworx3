class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.text :description
      t.integer :owner
      t.string :icon

      t.timestamps
    end
    
    create_table(:participants_teams, :id => false) do |t|
      t.integer :team_id
      t.integer :participant_id
    end
    add_index(:participants_teams,:team_id,:name=>'participants_teams_team_id')
    add_index(:participants_teams,:participant_id,:name=>'participants_teams_participant_id')
  end
end
