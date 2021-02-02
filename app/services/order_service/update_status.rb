module OrderService
  class UpdateStatus < BaseService
    def call(order:, status:)
      order.update_attribute :status, status
      OrderUpdateStatusJob.perform_later(order.id)
      success()
    end
  end
end
