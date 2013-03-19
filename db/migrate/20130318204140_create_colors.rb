class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :color
      t.string :name

      t.timestamps
    end
  end
end
