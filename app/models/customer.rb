class Customer < ApplicationRecord
  validates :first_name, :last_name, :email, :address, presence: true
  validates :email, uniqueness: true
end