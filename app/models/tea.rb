class Tea < ApplicationRecord
  validates :name, :description, :temperature, :brew_time, presence: true
end
