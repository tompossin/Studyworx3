class AddColumnToPreferences < ActiveRecord::Migration
  def change
    add_column :preferences, :wallpaper, :boolean, default: false
  end
end
