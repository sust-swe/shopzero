class CartItemsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "cart_items_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
