FactoryBot.define do
  factory :order do
    orderer
    traits_for_enum(:status)

    trait :with_order_items do
      before(:create) do |order|
        product_ids = Product.pluck(:id).shuffle.take(rand(2...5))

        product_ids.each do |product_id|
          order.order_items << create(:order_item, order: order, product_id: product_id)
        end
      end
    end
  end
end
