class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :bio, :text
    add_column :users, :reviewboard, :boolean
  end
end
