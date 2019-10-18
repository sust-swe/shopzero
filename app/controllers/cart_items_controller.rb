class CartItemsController < ApplicationController
  include ProductsHelper
  include CartItemsHelper

  skip_before_action :verify_authenticity_token
  before_action :authorize_request

  def create
    @cart_item = current_user.cart_items.new(cart_item_params)
    if @cart_item.save
      render_cart_items @cart_item and return
    else
      render json: Message.unauthorized.as_json,status: 422 
    end
  end

  def show
    @cart_items = current_user.cart_items
    render_cart_items @cart_items
  end

  def update
    # @cart_item = current_user.cart_items.find_by(
    #   product_id: params[:product_id])
    # if @cart_item.update_attributes(cart_item_params)
    #   #ToDo: Safely Handle Update
    #   render_cart_items @cart_item and return
    # else
    #   render json: Message.unauthorized.as_json,status: 422 
    # end
  end

  private

    def cart_item_params
      params.permit(:product_id,:count,:checked_at_checkout)
    end

    def cart_update_params
      params.permit(:)
    end

    def render_cart_items(cart_items)
      render json: cart_items,include: {product: {only: product_json_params} },
    only: cart_json_params
    end
end