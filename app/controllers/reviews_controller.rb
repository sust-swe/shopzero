class ReviewsController < ApplicationController
  before_action :authorize_request, only: [:new, :create, :destroy]
  skip_before_action :verify_authenticity_token

  def new
    can_review = is_reviewable?(params[:product_id])
    review = Review.find_by(user_id: current_user.id, product_id: params[:product_id])
    render json: { can_review: can_review, review: review }
  end

  def create
    if is_reviewable?(params[:product_id])
      @review = Review.find_by(user_id: current_user.id, product_id: params[:product_id])
      if @review
        if @review.update_attributes!(review_params)
          @response = { message: Message.successful, review: @review }
          @status = 201
        else
          @response = { message: Message.unsuccessful }
          status = 400
        end
      else
        if @review = current_user.reviews.create!(review_params)
          @response = { message: Message.successful, review: @review }
          @status = 201
        else
          @response = { message: Message.unsuccessful }
          status = 400
        end
      end
    end
    render json: @response, status: @status
  end

  def show
    if request.headers[:Authorization].present?
      if authorize_request && current_user
        @reviews = Review.where(product_id: params[:id]).where.not(user_id: current_user.id)
      end
    else
      @reviews = Review.where(product_id: params[:id])
    end
    render json: { review: @reviews, total_rating: @reviews.average(:rating) }
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
