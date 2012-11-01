class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.integer :user_id
      t.integer :role_id
      t.integer :school_id
      t.integer :language_id
      t.boolean :prereq
      t.integer :accepted
      t.integer :theme
      t.binary :avatar
      t.binary :wallpaper

      t.timestamps
    end
  end
end
