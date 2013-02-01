class AddIndexesToAssignments < ActiveRecord::Migration
  def change
    add_index :assignments, [:school_id, :module, :order ]
  end
end
