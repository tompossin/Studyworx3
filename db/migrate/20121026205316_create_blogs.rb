class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.integer :user_id
      t.string :category
      t.string :topic
      t.text :excerpt
      t.text :article

      t.timestamps
    end
  end
end
