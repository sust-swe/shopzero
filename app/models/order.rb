class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user

  # validates :product_id, uniqueness: { scope: [:user_id, :order_no] }

  def new_order_no(user_id)
    last_order = Order.where(user_id: user_id).last
    unless last_order.nil?
      last_order.with_lock do
        return last_order.order_no + 1
      end
    end
    return 1
  end

  def create_order
  end
end
