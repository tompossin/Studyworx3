class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer :user_id
      t.integer :school_id
      t.integer :assignment_id
      t.integer :task_id
      t.text :content, :limit => 16777215
      t.integer :content_type, :default => 0
      t.text :staff_note

      t.timestamps
    end
    add_index :documents, [:school_id,:assignment_id,:task_id]
    add_index :documents, :user_id
  end
end
