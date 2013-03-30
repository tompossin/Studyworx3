class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.integer :school_id, null: false
      t.integer :position, null: false
      t.string :link
      t.string :color
      t.string :code
      t.string :name
      t.boolean :public

      t.timestamps
    end
    add_index :observations, :school_id
  end
end
