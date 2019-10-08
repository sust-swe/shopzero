class BrandsController < ApplicationController

  skip_before_action :verify_authenticity_token
  skip_before_action :authorize_request

  def create
    @brand = Brand.new(brand_params)
    if @brand.save!
      render json: @brand
    else
      head(:forbidden)
    end
  end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end
end
