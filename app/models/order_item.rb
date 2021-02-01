class OrderItem < ApplicationRecord
  belongs_to :order, counter_cache: :order_line_count
  belongs_to :product
end
