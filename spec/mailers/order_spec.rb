require "rails_helper"

RSpec.describe OrderMailer, type: :mailer do
  before(:each) do
    @order = FactoryBot.create(:order, :with_order_item_products)
  end

  describe "update_status" do
    let(:mail) { OrderMailer.update_status(@order) }

    it "renders the headers" do
      expect(mail.subject).to eq("Update status")
      expect(mail.to).to eq([@order.orderer.email])
      expect(mail.from).to eq(["no-reply@toidang.xyz"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("status change to")
    end
  end
end
