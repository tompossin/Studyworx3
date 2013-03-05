class AddIndexToDuedates < ActiveRecord::Migration
  def change
    add_index :duedates, :duedate
  end
end
