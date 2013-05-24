class AddBillingFieldToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :billed, :boolean, default: false
    add_column :orders, :paid, :boolean,default: false
  end
end
