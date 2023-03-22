# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Debt.destroy_all
Expense.destroy_all
Category.destroy_all
Currency.destroy_all
Group.destroy_all

%w(bills food car).each do |cat|
	Category.create!(item: cat)
end

%w(INR USD EUR).each do |cat|
	Currency.create!(name: cat)
end

house = Group.create!(name: "Goa Trip")
team = Group.create!(name: "Mandu Trip")

vaibhav = house.users.create!(name: "Vaibhav", email: "vaibhav@yopmail.com", password: "12345678")
rahul = house.users.create!(name: "Rahul", email: "rahul@yopmail.com", password: "12345678")
ram = house.users.create!(name: "Ram", email: "ram@yopmail.com", password: "12345678")

sita = team.users.create!(name: "Sita", email: "site@yopmail.com", password: "12345678")
vaibhav.memberships.create!(group: team)

vaibhav.expenses.create!(name: "Travel", notes: "testing", date: Date.yesterday, amount: 30, share: 10, group: house)
rahul.expenses.create!(name: "Rent", date: Date.yesterday, amount: 3000, share: 1000, group: house)
ram.expenses.create!(name: "Netflix", date: Date.yesterday, amount: 9, share: 3, group: house)

sita.expenses.create!(name: "Registration Fees", date: Date.today, amount: 150, share:75, group: team)

vaibhav.debts.create!(amount: 75, reconciled: false, expense: sita.expenses.first)
vaibhav.debts.create!(amount: 1000, reconciled: false, expense_id: rahul.expenses.first.id)
vaibhav.debts.create!(amount: 3, reconciled: false, expense_id: ram.expenses.first.id)

rahul.debts.create!(amount: 10, reconciled: false, expense_id: vaibhav.expenses.first.id)
rahul.debts.create!(amount: 3, reconciled: false, expense_id: ram.expenses.first.id)

ram.debts.create!(amount: 1000, reconciled: false, expense_id: rahul.expenses.first.id)
ram.debts.create!(amount: 10, reconciled: false, expense_id: ram.expenses.first.id)
