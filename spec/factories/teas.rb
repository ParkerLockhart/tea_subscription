require 'faker'
FactoryBot.define do
  factory :tea do
    name { Faker::Tea.variety }
    description { Faker::Emotion.noun + ' ' + Faker::Dessert.flavor }
    temperature { Faker::Number.between(from: 140, to: 212) }
    brew_time { Faker::Number.between(from: 1, to: 10) }
  end
end
