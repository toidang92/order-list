require 'rails_helper'

RSpec.describe OrderUpdateStatusJob, type: :job do
  before(:each) do
    @order = FactoryBot.create(:order, :with_order_item_products)
  end

  describe "#perform_later" do
    it "send a email" do
      ActiveJob::Base.queue_adapter = :test
      expect {
        OrderUpdateStatusJob.perform_later(@order.id)
      }.to have_enqueued_job.with(@order.id).on_queue('mailers')
    end
  end
end
