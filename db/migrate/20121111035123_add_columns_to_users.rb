class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :integer
    add_column :users, :wallpaper, :integer
    add_column :users, :theme, :integer
  end
end
