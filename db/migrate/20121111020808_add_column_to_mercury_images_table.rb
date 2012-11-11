class AddColumnToMercuryImagesTable < ActiveRecord::Migration
  def change
    add_column :mercury_images, :user_id, :integer
    add_index :mercury_images, :user_id
  end
end
