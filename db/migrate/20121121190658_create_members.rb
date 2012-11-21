class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :user_id
      t.integer :member_id

      t.timestamps
    end
    add_index :members, :user_id
    add_index :members, :member_id
  end
end
