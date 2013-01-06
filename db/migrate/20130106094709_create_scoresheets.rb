class CreateScoresheets < ActiveRecord::Migration
  def change
    create_table :scoresheets do |t|
      t.integer :school_id
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
