class CategoriesController < ApplicationController
  def index
    render json: Category.all.as_json
  end

  def show
    if params[:id].present?
      @categories = Category.find(params[:id])
    else
      head(:not_found)
    end
    render json: @categories.as_json
  end
end
