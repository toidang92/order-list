FactoryBot.define do
  factory :order_item do
    order nil
    product nil
    price { Faker::Number.within(range: 10000..100000) }
    amount { Faker::Number.within(range: 1..10) }
  end
end
