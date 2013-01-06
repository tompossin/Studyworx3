class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :short_name
      t.string :name
      t.integer :verse_count

      t.timestamps
    end
  end
end
