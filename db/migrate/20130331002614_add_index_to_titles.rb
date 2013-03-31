class AddIndexToTitles < ActiveRecord::Migration
  def change
    remove_index :titles, [:user_id,:assignment_id, :position]
    add_index :titles, [:user_id, :task_id, :position]
    add_index :titles, :assignment_id
  end
end
