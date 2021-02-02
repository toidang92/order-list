class OrderItem < ApplicationRecord
  validates :price, :amount, presence: true
  validates :price, :amount, numericality: { greater_than: 0 }

  belongs_to :order, counter_cache: :order_line_count
  belongs_to :product

  before_validation :calculate_payment_amount
  after_commit :update_order_payment

  def update_order_payment
    order.update_attribute :payment_amount, order.order_items.sum(:payment_amount)
  end

  def calculate_payment_amount
    return self.payment_amount = 0 if self.amount.nil? || self.price.nil?
    self.payment_amount = amount * price
  end
end
