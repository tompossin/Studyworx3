class AddFirstnameToUser < ActiveRecord::Migration
  def up
    add_column :users, :firstname, :text
    add_column :users, :lastname, :text
  end
  def down
    remove_column :users, :firstname, :text
    remove_column :users, :lastname, :text
  end
end
