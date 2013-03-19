class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.integer :user_id
      t.integer :theme_id
      t.string :bgcolor
      t.integer :rows

      t.timestamps
    end
  end
end
