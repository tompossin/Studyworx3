class AddTitleIdIndex < ActiveRecord::Migration
  def change
    add_index :ppoints, :title_id
  end

end
