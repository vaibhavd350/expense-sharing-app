class AddGroupIdToExpenses < ActiveRecord::Migration[7.0]
  def change
    change_table :expenses do |t|

      t.references :group
    end
  end
end
