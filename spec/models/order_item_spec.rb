require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  let(:order) { FactoryBot.create(:order, :with_order_item_products) }
  subject { FactoryBot.build(:order_item, :with_product, order: order, payment_amount: 10) }

  describe 'associations' do
    it do
      should belong_to(:order).class_name('Order').counter_cache(:order_line_count)
    end

    it do
      should belong_to(:product).class_name('Product')
    end
  end

  describe 'validations' do
    %i[order product].each do |column|
      it do
        should validate_presence_of(column).with_message(:required)
      end
    end


    %i[price amount].each do |column|
      it do
        should validate_presence_of(column)
        should validate_numericality_of(column).is_greater_than(0)
      end
    end

    it do
      should have_db_index([:order_id, :product_id]).unique(true)
    end
  end
end
