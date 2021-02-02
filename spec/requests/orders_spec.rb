 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe OrdersController, type: :controller do
  # Order. As you add validations to Order, be sure to
  # adjust the attributes here as well.

  it { should use_before_action(:authenticate_user!) }

  describe "GET /index" do
    it "renders a successful response with admin user" do
      user = FactoryBot.create(:user, role: :admin)
      sign_in user
      get :index
      should respond_with(200)
    end

    it "renders a successful response with guest user" do
      user = FactoryBot.create(:user, role: :guest)
      sign_in user
      get :index
      should respond_with(302)
    end
  end

  describe "GET /show" do
    before(:each) do
      user = FactoryBot.create(:user, role: :admin)
      sign_in user
      @order = FactoryBot.create(:order, :with_order_item_products)
    end

    it "renders a successful response" do
      order = FactoryBot.create(:order, :with_order_item_products)
      get :show, params: { id: @order.id }
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    before(:each) do
      user = FactoryBot.create(:user, role: :admin)
      sign_in user
      @order = FactoryBot.create(:order, :with_order_item_products)
    end

    it "render a successful response" do
      get :edit, params: { id: @order.id }
      expect(response).to be_successful
    end
  end

  describe "PATCH /update" do
    before(:each) do
      user = FactoryBot.create(:user, role: :admin)
      sign_in user
      @order = FactoryBot.create(:order, :with_order_item_products, status: :order_new)
    end

    context "with valid parameters" do
      it "updates the requested order" do
        patch :update, params: { id: @order.id, order: { status: :completed } }
        should set_flash[:success]
        should redirect_to(order_path(@order))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch :update, params: { id: @order.id, order: { status: :order_new } }
        should set_flash[:error]
        should redirect_to(edit_order_path(@order))
      end
    end
  end
end
