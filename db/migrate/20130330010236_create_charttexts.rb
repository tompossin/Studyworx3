class CreateCharttexts < ActiveRecord::Migration
  def change
    create_table :charttexts do |t|
      t.integer :user_id, null: false
      t.integer :title_id, null: false
      t.text :content
      t.text :staff_note
      t.integer :content_type, default: 0

      t.timestamps
    end
    add_index :charttexts, [:user_id,:title_id]
  end
end
