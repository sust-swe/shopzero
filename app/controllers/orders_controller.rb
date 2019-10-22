class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorize_request
  def create
    @cart_items = current_user.cart_items.where("checked_at_checkout like ?",true)
    render json: @cart_items
  end
end
