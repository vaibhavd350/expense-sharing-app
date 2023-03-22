class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships do |t|
      t.references :user
      t.references :user_group

      t.timestamps
    end
  end
end
