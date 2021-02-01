class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update]

  def index
    if params.key?(:search_form)
      @search_form = SearchForm.new(search_params)
    else
      @search_form = SearchForm.new
    end

    @orders = Order.page params[:page]
  end

  def show
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def search_params
    params.require(:search_form).permit(:email)
  end

  def order_params
    params.require(:order).permit(:status)
  end
end
