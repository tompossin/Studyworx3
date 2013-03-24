class AddColumnsToGrades < ActiveRecord::Migration
  def change
    add_column :grades, :done, :boolean, default: false
    add_column :grades, :viewable, :boolean, default: false
    add_index :grades, :done
  end
end
