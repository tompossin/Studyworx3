class CreateTurnins < ActiveRecord::Migration
  def change
    create_table :turnins do |t|
      t.integer :user_id
      t.integer :assignment_id
      t.integer :staff_id
      t.text :comment
      t.boolean :done, default: false

      t.timestamps
    end
    add_index :turnins, [:user_id, :assignment_id]
    add_index :turnins, :staff_id
  end
end
