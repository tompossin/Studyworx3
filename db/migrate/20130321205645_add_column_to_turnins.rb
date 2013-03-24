class AddColumnToTurnins < ActiveRecord::Migration
  def change
    add_column :turnins, :viewable, :boolean, default: false
    add_index :turnins, :done
    add_index :turnins, :viewable
  end
end
