class CreateUserAdmins < ActiveRecord::Migration
  def change
    create_table :user_admins do |t|
      t.integer :user_id
      t.integer :level

      t.timestamps
    end
  end
end
