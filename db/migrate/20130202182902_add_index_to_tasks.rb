class AddIndexToTasks < ActiveRecord::Migration
  def change
    add_index :tasks, [:assignment_id,:position]
  end
end
