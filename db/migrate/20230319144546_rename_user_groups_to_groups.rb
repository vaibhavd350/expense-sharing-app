class RenameUserGroupsToGroups < ActiveRecord::Migration[7.0]
  def change
    rename_table :user_groups, :groups
  end
end
