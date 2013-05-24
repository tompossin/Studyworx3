class AddFieldToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :school_id, :integer
  end
end
