class Order < ApplicationRecord
  enum status: {
    order_new:  0,
    processing: 1,
    payment:    2,
    shipped:    3,
    cancelled:  4,
    completed:  5,
  }, _default: :order_new

  belongs_to :orderer, class_name: 'User', foreign_key: 'user_id', inverse_of: :orders
  has_many :order_lines, dependent: :delete_all

  before_create :generate_order_id

  private

  def generate_order_id
    begin
      self.order_id = SecureRandom.hex(10)
    end while Order.where(id: self.order_id).exists?
  end
end
