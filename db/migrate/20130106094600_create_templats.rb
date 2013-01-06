class CreateTemplats < ActiveRecord::Migration
  def change
    create_table :templats do |t|
      t.integer :school_id
      t.string :name
      t.text :content
      t.boolean :public

      t.timestamps
    end
  end
end
