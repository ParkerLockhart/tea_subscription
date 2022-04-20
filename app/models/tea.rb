class Tea < ApplicationRecord
  validates :name, :description, :temperature, :brew_time, presence: true
  has_many :subscription_teas
  has_many :subscriptions, through: :subscription_teas
end
