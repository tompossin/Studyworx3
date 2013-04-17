class AddIndexToStaffnotes < ActiveRecord::Migration
  def change
    add_index :staffnotes, [:noteable_id,:noteable_type]
    add_index :staffnotes, [:user_id,:assignment_id]
  end
end
