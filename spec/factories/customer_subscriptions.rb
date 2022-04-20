FactoryBot.define do
  factory :customer_subscription do
    association :customer, factory: :customer
    association :subscription, factory: :subscription
    status { [0, 1, 2].sample }
  end
end
