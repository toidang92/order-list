require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      order_id: "Order",
      status: "Status",
      total_price: "Total Price"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Order/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Total Price/)
  end
end
