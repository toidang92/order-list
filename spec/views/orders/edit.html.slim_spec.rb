require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      order_id: "MyString",
      status: "MyString",
      total_price: "MyString"
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input[name=?]", "order[order_id]"

      assert_select "input[name=?]", "order[status]"

      assert_select "input[name=?]", "order[total_price]"
    end
  end
end
