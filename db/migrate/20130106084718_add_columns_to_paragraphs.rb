class AddColumnsToParagraphs < ActiveRecord::Migration
  def change
    add_column :paragraphs, :created_at, :timestamp
    add_column :paragraphs, :updated_at, :timestamp
  end
end
