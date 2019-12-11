class ReviewsController < ApplicationController
  before_action :authorize_request
  skip_before_action :verify_authenticity_token

  def new
    can_review = is_reviewable?(params[:product_id])
    review = Review.find_by(user_id: current_user.id, product_id: params[:product_id])
    render json: { can_review: can_review, review: review }
  end

  def create
    if is_reviewable?(params[:product_id])
      @review = Review.find_by(user_id: current_user.id, product_id: params[:product_id])
      @review_method = @review ? "update_attributes!" : "create!"
      if @review.send("#{@review_method}", review_params)
        @response = { message: Message.successful, review: @review }
        @status = 201
      else
        @response = { message: Message.unsuccessful }
        status = 400
      end
    else
      @response = { message: Message.permission_denied }
      status = 422
    end
    render json: @response, status: @status
  end

  def destroy
    @review = Review.find(params[:id])
    if @review
      if @review.destroy
        render json: { message: Message.successful }, status: 200
      end
    else
      render json: { message: Message.not_found }, status: 404
    end
  end

  private

  def review_params
    params.permit(:product_id, :title, :rating, :body)
  end

  def is_reviewable?(product_id)
    return !current_user.orders.where(product_id: product_id, delivered: true).empty?
  end
end
