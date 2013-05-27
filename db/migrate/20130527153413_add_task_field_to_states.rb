class AddTaskFieldToStates < ActiveRecord::Migration
  def change
    drop_table :states
    create_table :states do |t|
      t.integer :user_id
      t.integer :task_id
      t.boolean :uptodate, default: false

      t.timestamps
    end
    add_index :states, [:user_id,:task_id]
  end
end
