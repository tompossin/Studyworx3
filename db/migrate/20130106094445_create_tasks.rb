class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :assignment_id
      t.integer :templat_id
      t.string :name
      t.float :percent
      t.text :help
      t.integer :task_type
      t.integer :task_order

      t.timestamps
    end
  end
end
