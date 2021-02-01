module OrderService
  class UpdateStatus < BaseService
    def call(order:, status:)
      order.update_attribute :status, status
      OrderUpdateStatusJob.perform_later(order_id)
      success()
    end
  end
end
