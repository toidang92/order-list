require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        order_id: "Order",
        status: "Status",
        total_price: "Total Price"
      ),
      Order.create!(
        order_id: "Order",
        status: "Status",
        total_price: "Total Price"
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", text: "Order".to_s, count: 2
    assert_select "tr>td", text: "Status".to_s, count: 2
    assert_select "tr>td", text: "Total Price".to_s, count: 2
  end
end
