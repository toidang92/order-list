class AddOrderSampleData < ActiveRecord::Migration[6.1]
  def up
    ActiveRecord::Base.transaction do
      10.times.map do
        FactoryBot.create(:product)
      end

      users = 10.times.map do
        FactoryBot.create(:user)
      end

      52.times.each do
        FactoryBot.create(:order, :with_order_items, orderer: users.sample)
      end
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigra
  end
end
