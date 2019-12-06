class ReviewsController < ApplicationController
  before_action :authorize_request

  def new
    can_review = false
    current_review = Review.find_by(user_id: current_user.id, product_id: params[:product_id])
    unless current_user.orders.where(product_id: params[:product_id], delivered: true).empty?
      can_review = true
    end
    render json: { can_review: can_review, review: current_review }
  end

  def create
  end

  def show
  end

  def index
  end
end
