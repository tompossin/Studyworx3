class CreateHelps < ActiveRecord::Migration
  def change
    create_table :helps do |t|
      t.string :title
      t.text :content
      t.integer :content_type, default: 0

      t.timestamps
    end
  end
end
