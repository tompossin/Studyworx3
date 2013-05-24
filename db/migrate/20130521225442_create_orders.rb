class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :name
      t.string :subject
      t.text :description
      t.text :location
      t.integer :enrollment
      t.datetime :start_date
      t.datetime :end_date
      t.float :price, default: 0.00
      t.boolean :approved

      t.timestamps
    end
    add_index :orders, :user_id
  end
end
