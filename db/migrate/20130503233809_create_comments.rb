class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :task_id
      t.integer :parent_id
      t.integer :user_id
      t.text :content
      t.integer :comments_count

      t.timestamps
    end
    add_index :comments, :task_id
    add_index :comments, :parent_id
    add_index :comments, :user_id
  end
end
