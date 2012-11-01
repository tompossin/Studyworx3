class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.integer :version_id
      t.integer :language_id
      t.string :name
      t.string :location
      t.text :prereqs
      t.datetime :start_date
      t.datetime :end_date
      t.text :mailing_address
      t.text :tagline
      t.text :description
      t.boolean :enrolement_type
      t.boolean :active
      t.string :timezone

      t.timestamps
    end
  end
end
