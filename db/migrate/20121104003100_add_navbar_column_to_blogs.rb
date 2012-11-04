class AddNavbarColumnToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :navbar, :boolean
  end
end
