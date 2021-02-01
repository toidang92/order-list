class OrderUpdateStatusJob < ApplicationJob
  queue_as :order

  def perform(order_id)
    # Do something later
  end
end
