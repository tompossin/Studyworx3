class AddColumnToTemplats < ActiveRecord::Migration
  def change
    add_column :templats, :content_type, :integer, default: 0
  end
end
