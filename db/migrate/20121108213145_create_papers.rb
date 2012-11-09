class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.integer :user_id
      t.string :title
      t.text :synopsis
      t.text :body, :limit => 2.megabytes
      t.boolean :published

      t.timestamps
    end
  end
end
