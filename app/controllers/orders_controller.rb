class OrdersController < ApplicationController
  include CartItemsHelper

  skip_before_action :verify_authenticity_token
  before_action :authorize_request

  def create
    @cart_items = current_user.cart_items.where("checked_at_checkout like ?", true)
    order_no = Order.new.new_order_no
    order_messages = []
    @cart_items.each do |cart_item|
      order = current_user.orders.new(order_no: order_no, product_id: cart_item.product_id)
      order_messages.push(message: "#{cart_item.product.name} #{order.save ? "success" : "failed"}")
      cart_item.delete
    end
    render json: order_messages.as_json
    broadcast_cart
  end
end
