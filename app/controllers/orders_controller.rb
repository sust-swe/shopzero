class OrdersController < ApplicationController
  include CartItemsHelper

  skip_before_action :verify_authenticity_token
  before_action :authorize_request

  def create
    @cart_items = current_user.cart_items.where("checked_at_checkout like ?", true)
    order_messages = []
    @cart_items.each do |cart_item|
      cart_item.with_lock do
        product = cart_item.product
        product.with_lock do
          if (product.stock > 0)
            order = current_user.orders.new(product_id: cart_item.product_id)
            @order_no ||= order.new_order_no current_user.id
            order.order_no = @order_no
            order_messages.push(message: "#{product.name} #{order.save ? "success" : "failed"}")
            cart_item.delete
          else
            order_messages.push(message: "#{product.name} is Out of stock")
          end
        end
      end
    end
    render json: order_messages.as_json
    broadcast_cart
  end
end
