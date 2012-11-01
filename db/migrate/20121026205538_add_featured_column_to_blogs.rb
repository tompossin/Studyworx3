class AddFeaturedColumnToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :featured, :boolean
  end
end
