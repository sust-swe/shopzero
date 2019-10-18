module CartItemsHelper
  def cart_json_params
    [:id,:user_id,:product_id,:count,:checked_at_checkout]    
  end
end
