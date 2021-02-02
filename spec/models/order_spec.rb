require 'rails_helper'

RSpec.describe Order, type: :model do
  it do
    should define_enum_for(:status).with_values(
      order_new:  0,
      processing: 1,
      paid:       2,
      shipped:    3,
      cancelled:  4,
      completed:  5
    )
  end

  describe 'associations' do
    it { should belong_to(:orderer).class_name('User').with_foreign_key('user_id').inverse_of(:orders) }
    it { should have_many(:order_items).class_name('OrderItem').dependent(:delete_all) }
  end

  describe 'validations' do
    %i[payment_amount].each do |column|
      it { should validate_presence_of(column) }
      it { should validate_numericality_of(column).is_greater_than(0) }
    end

    it { should validate_uniqueness_of(:order_id).ignoring_case_sensitivity }
    it { should have_db_index(:order_id).unique(true) }
  end
end
