class AddIndexToPreferences < ActiveRecord::Migration
  def change
    add_index :preferences, :user_id
  end
end
