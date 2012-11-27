class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :owner_id
      t.integer :school_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
