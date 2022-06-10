class CheckoutsController < ApplicationController

  def create
    @order_items = current_order.order_items
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: @order_items.collect{ |order_item| order_item.item.to_builder.attributes! },
      mode: 'payment',
      success_url: root_url,
      cancel_url: root_url
    })
    respond_to do |format|
      format.js
    end
  end
end
