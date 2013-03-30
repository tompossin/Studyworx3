class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.integer :parent_id
      t.integer :user_id, :null => false
      t.integer :school_id, :null => false
      t.integer :assignment_id, :null => false
      t.integer :task_id, :null => false
      t.integer :paragraph_id, :null => false
      t.integer :title_type, :null => false
      t.integer :position, :null => false
      t.string :title
      t.integer :verse_count, :null => false
      t.text :staff_note

      t.timestamps     
    end
    add_index :titles, [:user_id,:assignment_id,:position]
    add_index :titles, :school_id
    add_index :titles, :parent_id
    add_index :titles, :task_id
  end
end
