require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        user: "",
        order_id: "Order",
        status: 2,
        payment_amount: 3.5,
        order_line_count: 4
      ),
      Order.create!(
        user: "",
        order_id: "Order",
        status: 2,
        payment_amount: 3.5,
        order_line_count: 4
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "Order".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.5.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
  end
end
