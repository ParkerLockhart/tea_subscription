FactoryBot.define do
  factory :subscription_tea do
    association :subscription, factory: :subscription
    association :tea, factory: :tea
    status { [0, 1, 2].sample }
  end
end
