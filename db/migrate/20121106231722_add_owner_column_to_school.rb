class AddOwnerColumnToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :owner_id, :integer
  end
end
