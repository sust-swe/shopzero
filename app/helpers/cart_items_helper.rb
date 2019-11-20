module CartItemsHelper
  def cart_json_params
    [:id, :user_id, :product_id, :count, :checked_at_checkout]
  end

  def broadcast_cart
    @cart_items = current_user.cart_items
    CartItemsChannel.broadcast_to(current_user, { type: "cartItems",
                                                 data: @cart_items.as_json })
  end
end
