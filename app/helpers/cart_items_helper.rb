module CartItemsHelper
  include ProductsHelper

  def cart_json_params
    [:id, :user_id, :product_id, :count, :checked_at_checkout]
  end

  def broadcast_cart
    @cart_items = current_user.cart_items
    CartItemsChannel.broadcast_to(current_user, { type: "cartItems",
                                                 data: broadcast_cart_params(@cart_items) })
  end

  def broadcast_cart_params(cart_items)
    cart_items.as_json(include: { product: { only: product_json_params, include: [:brand] } },
                       only: cart_json_params)
  end
end
