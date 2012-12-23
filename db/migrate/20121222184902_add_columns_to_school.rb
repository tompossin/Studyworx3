class AddColumnsToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :caption, :string
    add_column :schools, :color, :string
  end
end
