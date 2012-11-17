class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.text :reminder
      t.text :public

      t.timestamps
    end
  end
end
