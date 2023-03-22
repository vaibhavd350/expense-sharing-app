class AddCurrencyToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :currency_id, :integer
  end
end
