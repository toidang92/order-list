require 'rails_helper'

RSpec.describe OrderService::UpdateStatus, type: :service do
  before(:each) do
    @order = FactoryBot.create(:order, :with_order_item_products, status: :order_new)
  end

  describe "update_status" do
    it "update same status" do
      response = OrderService::UpdateStatus.call(order: @order, status: @order.status)
      expect(response.success?).to eq(false)
      expect(response.errors).not_to eq(nil)
    end

    it "update diffirent status" do
      response = OrderService::UpdateStatus.call(order: @order, status: :shipped)
      expect(response.success?).to eq(true)
      @order.reload
      expect(@order.status).to eq("shipped")
    end
  end
end
