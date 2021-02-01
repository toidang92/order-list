class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, index: true

      t.string     :order_id, null: false
      t.integer    :status, null: false, default: 0
      t.float      :payment_amount, null: false, default: 0
      t.integer    :order_line_count, null: false, default: 0

      t.timestamps
    end

    add_index :orders, :order_id, unique: true
  end
end
