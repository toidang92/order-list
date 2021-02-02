class OrderMailer < ApplicationMailer
  def update_status(order)
    @order = order
    mail to: @order.orderer.email
  end
end
