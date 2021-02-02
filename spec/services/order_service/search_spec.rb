require 'rails_helper'

RSpec.describe OrderService::Search, type: :service do
  before(:each) do
    @order = FactoryBot.create(:order, :with_order_item_products, status: :order_new)
  end

  describe "search#call" do
    it "invalid search form" do
      search_form = SearchForm.new(email: "abc")
      response = OrderService::Search.call(search_form: search_form)
      expect(response.success?).to eq(false)
      expect(response.errors).not_to eq(nil)
      expect(response.orders).not_to eq(nil)
    end

    it "valid search form" do
      search_form = SearchForm.new(email: @order.orderer.email)
      response = OrderService::Search.call(search_form: search_form)
      expect(response.success?).to eq(true)
      expect(response.orders).not_to eq(nil)
    end
  end
end
