class CartItemsController < ApplicationController
  include ProductsHelper
  include CartItemsHelper

  skip_before_action :verify_authenticity_token
  before_action :authorize_request
  skip_before_action :authorize_request, only: :testcart

  def create
    @item = current_user.cart_items.find_by(product_id: params[:product_id])
    if @item.nil?
      @cart_item = current_user.cart_items.new(cart_item_params)
      if @cart_item.save
        render_cart_items @cart_item
        broadcast_cart and return
      else
        render json: Message.unauthorized.as_json, status: 422
      end
    else
      params[:count] += @item.count
      if @item.update_attributes!(cart_item_params)
        render_cart_items @item
        broadcast_cart
      else
        render json: Message.unauthorized.as_json, status: 422
      end
    end
  end

  def show
    @cart_items = current_user.cart_items
    render_cart_items @cart_items
  end

  def update
    @cart_item = current_user.cart_items.find_by(
      product_id: params[:product_id],
    ) || CartItem.new
    if @cart_item.update_attributes!(cart_item_params)
      render_cart_items @cart_item
      broadcast_cart
    end
  end

  def destroy
    @cart_item = current_user.cart_items.find_by(
      product_id: params[:product_id],
    )
    if @cart_item
      if @cart_item.destroy
        render json: { message: "Deleted Successfully" }, status: 201
        broadcast_cart
      end
    else
      render json: { message: "No Such Items" }, status: 400
    end
  end

  private

  def cart_item_params
    params.permit(:product_id, :count, :checked_at_checkout)
  end

  def render_cart_items(cart_items)
    render json: cart_items, include: { product: { only: product_json_params } },
           only: cart_json_params, status: 201
  end
end
