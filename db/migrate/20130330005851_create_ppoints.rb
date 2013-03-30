class CreatePpoints < ActiveRecord::Migration
  def change
    create_table :ppoints do |t|
      t.integer :title_id, null: false
      t.integer :user_id, null: false
      t.integer :observation_id
      t.integer :position, null: false
      t.text :content
      t.string :color
      t.text :staff_note

      t.timestamps
    end
    add_index :ppoints, [:user_id,:title_id]
    add_index :ppoints, :position
  end
end
