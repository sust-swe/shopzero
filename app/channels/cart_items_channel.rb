class CartItemsChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user
    CartItemsChannel.broadcast_to(current_user, { type: "cartItems",
                                                 data: broadcast_cart_params(current_user.cart_items) })
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  private

  def broadcast_cart_params(cart_items)
    cart_items.as_json(include: { product: { only: product_json_params, include: [:brand] } },
                       only: cart_json_params)
  end

  def product_json_params
    [:id, :name, :sales_price, :retail_price, :picture, :stock, :features, :description]
  end

  def cart_json_params
    [:id, :user_id, :product_id, :count, :checked_at_checkout]
  end
end
