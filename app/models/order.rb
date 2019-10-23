class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :product_id, uniqueness: { scope: [:user_id,:order_no] }

  def new_order_no
    last_order = Order.last
    return (last_order.order_no + 1) unless last_order.nil?
    return 1
  end
end
