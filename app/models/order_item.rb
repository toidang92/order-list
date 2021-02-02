class OrderItem < ApplicationRecord
  validates :payment_amount, :price, :amount, presence: true
  validates :payment_amount, :price, :amount, numericality: { greater_than: 1 }

  belongs_to :order, counter_cache: :order_line_count
  belongs_to :product

  before_validation :calculate_payment_amount
  after_save :update_order_payment

  def update_order_payment
    order.update_attribute :payment_amount, order.order_items.sum(:payment_amount)
  end

  def calculate_payment_amount
    self.payment_amount = amount * price
  end
end
