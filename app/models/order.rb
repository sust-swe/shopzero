class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
  after_save :decrease_product_stock
  before_save :check_stock

  validates :product_id, uniqueness: { scope: [:user_id, :order_no] }

  def new_order_no
    last_order = Order.last
    last_order.with_lock do
      return (last_order.order_no + 1) unless last_order.nil?
      return 1
    end
  end

  def check_stock
  end
end
