require 'faker'
FactoryBot.define do
  factory :Subscription do
    title { Faker::Space.constellation }
    price {Faker::Number.number(digits: 4) }
    frequency { [0, 1, 2, 3].sample }
  end
end 
