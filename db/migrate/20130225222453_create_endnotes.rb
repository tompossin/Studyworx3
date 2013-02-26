class CreateEndnotes < ActiveRecord::Migration
  def change
    create_table :endnotes do |t|
      t.integer :answer_id
      t.integer :paper_id
      t.text :content, :limit => 16777215

      t.timestamps
    end
  end
end
