FactoryBot.define do
  factory :order_item do
    order nil
    product nil
    price { Faker::Number.within(range: 10000..100000) }
    amount { Faker::Number.within(range: 2..10) }

    trait :with_product do
      product
    end
  end
end
