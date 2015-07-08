class AlterOrdersTable < ActiveRecord::Migration
  def change
    change_column :orders, :approved, :boolean, null: false,  default: false
  end

end
