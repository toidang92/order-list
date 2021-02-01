class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string  :sku, null: false

      t.string  :name, null: false
      t.float   :price, null: false, default: 0
      t.integer :amount, null: false, default: 0

      t.timestamps
    end

    add_index :products, :sku, unique: true
  end
end
