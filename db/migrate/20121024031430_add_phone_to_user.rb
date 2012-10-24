class AddPhoneToUser < ActiveRecord::Migration
  def up
    add_column :users, :phone, :string
    add_column :users, :address, :text
  end
  def down
    remove_column :users, :phone, :string
    remove_column :users, :address, :text
  end
end
