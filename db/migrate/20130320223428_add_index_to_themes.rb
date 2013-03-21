class AddIndexToThemes < ActiveRecord::Migration
  def change
    add_index :themes, :filename, unique: true
  end
end
