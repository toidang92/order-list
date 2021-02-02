class OrderUpdateStatusJob < ApplicationJob
  queue_as :mailers

  def perform(order_id)
    order = Order.find(order_id)
    OrderMailer.update_status(order).deliver_now
  end
end
