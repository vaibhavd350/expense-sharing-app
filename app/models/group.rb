class Group < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships

  has_many :invites

  has_many :expenses
end
