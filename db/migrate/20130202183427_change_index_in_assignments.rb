class ChangeIndexInAssignments < ActiveRecord::Migration
  def up
    remove_index :assignments, [:school_id,:module,:a_order]
    add_index :assignments, [:school_id,:module,:position]
  end

  def down
    remove_index :assignments, [:school_id,:module,:position]
  end
end
