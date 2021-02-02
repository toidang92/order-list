FactoryBot.define do
  factory :order do
    orderer
    traits_for_enum(:status)

    trait :with_order_items do
      after(:create) do |order|
        product_ids = Product.pluck(:id).shuffle.take(rand(2...5))

        product_ids.each do |product_id|
          create(:order_item, order_id: order.id, product_id: product_id)
        end
      end
    end
  end
end
