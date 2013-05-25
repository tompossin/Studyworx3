class CreateWhiteboards < ActiveRecord::Migration
  def change
    create_table :whiteboards do |t|
      t.integer :school_id
      t.integer :user_id
      t.text :content
      t.integer :content_type, default: 0

      t.timestamps
    end
    add_index :whiteboards, :school_id
  end
end
