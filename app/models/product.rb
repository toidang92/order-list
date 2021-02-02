class Product < ApplicationRecord
  validates :name, :price, :amount, presence: true
  validates :price, numericality: { greater_than: 1 }

  has_many :order_items, dependent: :delete_all

  before_create :generate_sku

  private

  def generate_sku
    begin
      self.sku = SecureRandom.hex(10)
    end while Product.where(id: self.sku).exists?
  end
end
