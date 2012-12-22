class AddSchoolToUser < ActiveRecord::Migration
  def change
    add_column :users, :school, :integer, :default => 0
  end
end
