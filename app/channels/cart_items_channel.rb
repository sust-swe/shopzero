class CartItemsChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user
    CartItemsChannel.broadcast_to(current_user, current_user.cart_items.as_json)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
