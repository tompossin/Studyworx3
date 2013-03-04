class AddColumnToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :content_type, :integer, :default=>0
  end
end
