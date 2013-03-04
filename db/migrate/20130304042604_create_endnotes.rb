class CreateEndnotes < ActiveRecord::Migration
  def change
    create_table :endnotes do |t|
      t.integer :document_id
      t.integer :paper_id
      t.text :content, :limit => 16777215
      t.integer :content_type, :default => 0

      t.timestamps
    end
    add_index :endnotes, :document_id
    add_index :endnotes, :paper_id
  end
end
