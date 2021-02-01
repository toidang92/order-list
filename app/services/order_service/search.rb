module OrderService
  class Search < BaseService
    def call(search_form:)
      orders = Order.joins(:orderer).where(users: { email: search_form.email })
      orders = orders.order(search_form.order_query) if search_form.order_query.present?
      orders = orders.page(search_form.page)
      success({ orders: orders })
    end
  end
end
