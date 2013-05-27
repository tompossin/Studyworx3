class CreateLastmessages < ActiveRecord::Migration
  def change
    create_table :lastmessages do |t|
      t.integer :user_id
      t.integer :lastviewed
      t.boolean :team, default: false

      t.timestamps
    end
    add_index :lastmessages, :user_id
  end
end
