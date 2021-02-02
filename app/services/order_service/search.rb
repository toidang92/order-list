module OrderService
  class Search < BaseService
    def call(search_form:)
      if search_form.invalid?
        return error({
          errors: search_form.errors.full_messages.join(', '),
          orders: Order.none.page(search_form.page)
        })
      end

      orders = Order.all

      if search_form.email.present?
        orders = orders.joins(:orderer).where(users: { email: search_form.email.strip })
      end

      if search_form.sort_query.present?
        orders = orders.order(search_form.sort_query)
      end

      if search_form.status.present?
        orders = orders.where(status: search_form.status)
      end

      orders = orders.page(search_form.page)

      success({ orders: orders })
    end
  end
end
