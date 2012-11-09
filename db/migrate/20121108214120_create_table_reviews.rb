class CreateTableReviews < ActiveRecord::Migration
  def change
      create_table :reviews do |t|
        t.integer :paper_id
        t.integer :user_id
        t.text :content
        t.boolean :approved, :default => false
  
        t.timestamps
      end
  end
end
