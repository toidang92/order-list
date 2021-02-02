class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update]

  def index
    if params.key?(:search_form)
      search_query = search_params
    else
      search_query = {}
    end

    @search_form = SearchForm.new(search_query)
    @orders = OrderService::Search.call(search_form: @search_form).orders
    @orders = @orders.includes(:orderer)
  end

  def show
  end

  def edit
  end

  def update
    OrderService::UpdateStatus.call(order: @order, status: order_params[:status])
    redirect_to @order
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def search_params
    params.require(:search_form).permit(:email, :status)
  end

  def order_params
    params.require(:order).permit(:status)
  end
end
