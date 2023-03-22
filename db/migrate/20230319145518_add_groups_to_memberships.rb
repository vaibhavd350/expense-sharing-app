class AddGroupsToMemberships < ActiveRecord::Migration[7.0]
  def change
        remove_column :memberships, :user_group_id
        change_table :memberships do |t|
          t.references :group

        end
  end
end
