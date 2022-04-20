class SubscriptionTea < ApplicationRecord
  enum status: { active: 0, paused: 1, cancelled: 2 }
  belongs_to :tea
  belongs_to :subscription
end
