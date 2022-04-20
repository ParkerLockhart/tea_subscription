FactoryBot.define do
  factory :subscription_tea do
    association :subscription, factory: :subscription
    association :tea, factory: :tea
  end
end
