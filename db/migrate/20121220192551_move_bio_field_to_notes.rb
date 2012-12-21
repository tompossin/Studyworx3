class MoveBioFieldToNotes < ActiveRecord::Migration
  def up
    remove_column :users, :bio
    add_column :notes, :bio, :text
  end

  def down
    add_column :users, :bio, :text
    remove_column :notes, :bio, :text
  end
end
