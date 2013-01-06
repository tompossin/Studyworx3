class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :school_id
      t.integer :book_id
      t.integer :scoresheet_id
      t.integer :order
      t.string :name
      t.integer :weight
      t.integer :module
      t.text :resources
      t.text :instructions

      t.timestamps
    end
  end
end
