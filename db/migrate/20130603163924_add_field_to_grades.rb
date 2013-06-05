class AddFieldToGrades < ActiveRecord::Migration
  def change
    add_column :grades, :duedate_id, :integer
  end
end
