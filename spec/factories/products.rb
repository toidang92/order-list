FactoryBot.define do
  factory :product do
    name { Faker::Book.title }
    price { Faker::Number.within(range: 10000..100000) }
    amount { Faker::Number.within(range: 100..1000) }
  end
end
