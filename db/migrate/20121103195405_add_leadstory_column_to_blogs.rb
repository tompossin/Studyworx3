class AddLeadstoryColumnToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :leadstory, :boolean
  end
end
