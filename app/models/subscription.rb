class Subscription < ApplicationRecord
  validates :title, :price, :frequency, presence: true
  enum frequency: { monthly: 0, weekly: 1, seasonal: 2, annual: 3 }
  has_many :subscription_teas
  has_many :teas, through: :subscription_teas
end
