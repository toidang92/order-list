require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      user: "",
      order_id: "MyString",
      status: 1,
      payment_amount: 1.5,
      order_line_count: 1
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input[name=?]", "order[user]"

      assert_select "input[name=?]", "order[order_id]"

      assert_select "input[name=?]", "order[status]"

      assert_select "input[name=?]", "order[payment_amount]"

      assert_select "input[name=?]", "order[order_line_count]"
    end
  end
end
