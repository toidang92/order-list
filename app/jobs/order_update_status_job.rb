class OrderUpdateStatusJob < ApplicationJob
  queue_as :order

  def perform(*args)
    # Do something later
  end
end
