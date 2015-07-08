class AddTitleIdIndexToCharttexts < ActiveRecord::Migration
  def change
    add_index :charttexts, :title_id
  end
end
