class AddColumnToScoresheets < ActiveRecord::Migration
  def change
    add_column :scoresheets, :content_type, :integer, default: 0
  end
end
