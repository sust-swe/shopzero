class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :product_id, uniqueness: { scope: [:user_id] }

  def add_item(count: 1)
    self.increment(:count,count)
  end

end
