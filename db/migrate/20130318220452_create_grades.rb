class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :school_id, null: false
      t.integer :assignment_id, null: false
      t.integer :user_id, null: false
      t.integer :staff_id
      t.integer :grade
      t.text :staff_comments
      t.text :student_comments
      t.text :scratchpad

      t.timestamps
    end
    add_index :grades, [:school_id,:assignment_id,:user_id]
    add_index :grades, :user_id
    add_index :grades, :staff_id
  end
end
