class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update]

  def index
    search_query = {}
    search_query = search_params if params.key?(:q)
    search_query[:page] = params[:page] if params.key?(:page)
    search_query[:sort] = params[:sort] if params.key?(:sort)

    @search_form = SearchForm.new(search_query)
    @orders = OrderService::Search.call(search_form: @search_form).orders
    @orders = @orders.includes(:orderer)
  end

  def show
    @order_items = @order.order_items.includes(:product)
  end

  def edit
  end

  def update
    response = OrderService::UpdateStatus.call(order: @order, status: order_params[:status])

    if response.success?
      redirect_to @order, flash: { success: "Updated successfully order's status!" }
    else
      redirect_to edit_order_path(@order), flash: { error: response.errors }
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def search_params
    params.require(:q).permit(:email, :status)
  end

  def order_params
    params.require(:order).permit(:status)
  end
end
