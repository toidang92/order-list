class Order < ApplicationRecord
  enum status: {
    order_new:  0,
    processing: 1,
    paid:       2,
    shipped:    3,
    cancelled:  4,
    completed:  5,
  }, _default: :order_new

  validate :validate_order_items
  validates_uniqueness_of :order_id, case_sensitive: false

  belongs_to :orderer, class_name: 'User', foreign_key: 'user_id', inverse_of: :orders
  has_many :order_items, dependent: :delete_all

  before_create :generate_order_id

  def validate_order_items
    errors.add(:order_items, "least at 1 order item") if order_items.size.zero?
  end

  def status_name
    self.class.human_enum_name(:status, status)
  end

  def self.statuses_for_select
    statuses.map do |status, _|
      [human_enum_name(:status, status), status]
    end
  end

  private

  def generate_order_id
    begin
      self.order_id = SecureRandom.hex(10).downcase
    end while Order.where(id: self.order_id).exists?
  end
end
