class Customer < ApplicationRecord
  validates :first_name, :last_name, :email, :address, presence: true
  validates :email, uniqueness: true
  has_many :customer_subscriptions
  has_many :subscriptions, through: :customer_subscriptions
end
