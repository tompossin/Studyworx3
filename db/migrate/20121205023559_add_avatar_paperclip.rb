class AddAvatarPaperclip < ActiveRecord::Migration
  def up
    add_attachment :users, :avatar
    add_attachment :users, :wallpaper
    add_attachment :users, :iotd
  end

  def down
    remove_attachment :users, :avatar
    remove_attachment :users, :wallpaper
    remove_attachment :users, :iotd
  end
end
