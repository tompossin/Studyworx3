class RemoveColumnsFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :avatar
    remove_column :users, :wallpaper
    drop_table :mercury_images
  end

  def down
    add_column :users, :avatar, :integer
    add_column :users, :wallpaper, :integer
    create_table "mercury_images", :force => true do |t|
      t.string   "image_file_name"
      t.string   "image_content_type"
      t.integer  "image_file_size"
      t.datetime "image_updated_at"
      t.datetime "created_at",         :null => false
      t.datetime "updated_at",         :null => false
      t.integer  "user_id"
    end
    add_index "mercury_images", ["user_id"], :name => "index_mercury_images_on_user_id"
  end
end
