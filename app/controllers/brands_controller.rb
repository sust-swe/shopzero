class BrandsController < ApplicationController
  def index
    render json: Brand.all.as_json
  end

  def show
    if params[:id].present?
      @brands = Brand.find(params[:id])
    else
      return head(:not_found)
    end
    render json: @brands.as_json
  end
end
