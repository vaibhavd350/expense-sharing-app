class ChangeColumnInInvites < ActiveRecord::Migration[7.0]
  def change
    rename_column :invites, :user_group_id, :group_id
  end
end
