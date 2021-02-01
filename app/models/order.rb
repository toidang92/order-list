class Order < ApplicationRecord
  enum status: [:order_new, :processing, :payment, :shipped, :cancel, :complete]

  belongs_to :orderer, class_name: 'User', inverse_of: :orders
  has_many :order_lines, dependent: :delete_all

  before_create :generate_order_id

  private

  def generate_order_id
    begin
      self.order_id = SecureRandom.hex(10)
    end while Order.where(id: self.order_id).exists?
  end
end
