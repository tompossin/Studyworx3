class CreateParagraphs < ActiveRecord::Migration
  def change
    create_table :paragraphs do |t|
      t.integer :book_id
      t.string :content
      t.integer :p_order
      t.string :startref
      t.string :endref
      t.integer :verse_count
      t.integer :version_id
      
    end
    add_index :paragraphs, [:version_id,:book_id,:p_order]
    
  end
end
