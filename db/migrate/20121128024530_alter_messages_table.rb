class AlterMessagesTable < ActiveRecord::Migration
  def up
    add_column :messages, :team_id, :integer
    rename_column(:messages, :has_read, :sender_read)
    rename_column(:messages, :archived, :recipient_read)
    remove_column(:messages, :sender_trashed)
    remove_column(:messages, :recipient_trashed)
    add_index(:messages, [:sender_id,:sender_read])
    add_index(:messages, [:recipient_id,:recipient_read])
    add_index(:messages, [:recipient_id, :team_id])
  end

  def down
    add_column(:messages, :sender_trashed, :boolean)
    add_column(:messages, :recipient_trashed, :boolean)
    remove_column :messages, :team_id
    rename_column(:messages, :sender_read, :has_read)
    rename_column(:messages, :recipient_read, :archived)
    remove_index(:messages, [:sender_id,:sender_read])
    remove_index(:messages, [:recipient_id,:recipient_read])
    remove_index(:messages, [:recipient_id, :team_id])
    
  end
end
