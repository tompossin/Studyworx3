class ChangeColumnsInAssignments < ActiveRecord::Migration
  def up
    rename_column :assignments, :a_order, :position
    rename_column :tasks, :task_order, :position
  end

  def down
    rename_column :assignments, :position, :a_order
    rename_column :tasks, :position, :task_order
  end
end
