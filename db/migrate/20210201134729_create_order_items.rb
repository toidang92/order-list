class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :order
      t.references :product

      t.float      :price, null: false, default: 0
      t.integer    :amount, null: false, default: 0
      t.float      :payment_amount, null: false, default: 0

      t.timestamps
    end

    add_index :order_items, [:order_id, :product_id], unique: true
  end
end
