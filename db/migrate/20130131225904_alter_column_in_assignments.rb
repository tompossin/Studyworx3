class AlterColumnInAssignments < ActiveRecord::Migration
  def up
    rename_column :assignments, :order, :a_order
    remove_index :assignments, name: :index_assignments_on_school_id_and_module_and_order
    add_index :assignments, [:school_id, :module, :a_order]
  end

  def down
    rename_column :assignments, :a_order, :order
    remove_index :assignments, name: :index_assignments_on_school_id_and_module_and_a_order
    add_index :assignments, [:school_id, :module, :order]
  end
end
