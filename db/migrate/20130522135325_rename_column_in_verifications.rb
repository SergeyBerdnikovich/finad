class RenameColumnInVerifications < ActiveRecord::Migration
  def up
    rename_column :verifications, :user_id, :adviser_user_id
  end

  def down
    rename_column :verifications, :adviser_user_id, :user_id
  end
end
