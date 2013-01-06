class CreateDuedates < ActiveRecord::Migration
  def change
    create_table :duedates do |t|
      t.integer :school_id
      t.integer :assignment_id
      t.integer :team_id
      t.datetime :due_date

      t.timestamps
    end
  end
end
