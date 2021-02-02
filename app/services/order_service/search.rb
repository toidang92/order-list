module OrderService
  class Search < BaseService
    def call(search_form:)
      orders = Order.all

      if search_form.email.present?
        orders = orders.joins(:orderer).where(users: { email: search_form.email.strip })
      end

      if search_form.order_query.present?
        orders = orders.order(search_form.order_query)
      end

      if search_form.status.present?
        orders = orders.where(status: search_form.status)
      end

      orders = orders.page(search_form.page)

      success({ orders: orders })
    end
  end
end
