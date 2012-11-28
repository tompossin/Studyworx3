class AlterMessagesTable < ActiveRecord::Migration
  def up
    rename_column(:messages, :has_read, :sender_read)
    rename_column(:messages, :archived, :recipient_read)
    add_index(:messages, [:sender_id,:sender_read])
    add_index(:messages, [:recipient_id,:recipient_read])
  end

  def down
    rename_column(:messages, :sender_read, :has_read)
    rename_column(:messages, :recipient_read, :archived)
    remove_index(:messages, [:sender_id,:sender_read])
    remove_index(:messages, [:recipient_id,:recipient_read])
  end
end
