class AddFieldToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :private, :boolean, default: false
  end
end
