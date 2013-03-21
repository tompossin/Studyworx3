class AddColumnToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :background, :boolean, default: false
  end
end
