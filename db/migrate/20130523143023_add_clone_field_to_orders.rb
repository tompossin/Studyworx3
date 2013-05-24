class AddCloneFieldToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :clone, :integer
  end
end
