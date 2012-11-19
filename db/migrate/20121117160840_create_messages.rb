class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :parent_id
      t.integer :sender_id
      t.integer :recipient_id
      t.integer :school_id
      t.boolean :has_read
      t.boolean :archived
      t.boolean :sender_trashed
      t.boolean :recipient_trashed
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
