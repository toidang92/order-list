module OrderService
  class UpdateStatus < BaseService
    def call(order:, status:)
      if (status.blank?)
        return error({
          errors: "Select a status!"
        })
      end

      if (order.status == status)
        return error({
          errors: "The order's status already is #{order.status_name}!"
        })
      end

      order.update_attribute :status, status
      OrderUpdateStatusJob.perform_later(order.id)

      success()
    end
  end
end
