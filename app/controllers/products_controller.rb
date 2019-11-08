class ProductsController < ApplicationController

  include ProductsHelper

  def index
    @products = Product.all
    render json: @products.as_json(only: product_json_params) and return
  end

  def search
    head(:not_found) if params[:name].nil? and return

    @products = search_by_product(params[:name])
    
    if @products.present?
      searchable_attribs.each do |attr|
        value = attr.to_sym
        @products = search_by(attr,@products,params[value]) if params[value]
      end
      render json: @products.as_json(
        include: searchable_attribs_json_params ,only: product_json_params
        ) and return
    end
  end

  private

    def search_by(attr,objects,value)
      if searchable_attribs.include? attr
        send("search_by_#{attr}",objects,value)
      else
        head(:not_found)
      end
    end

    def product_json_params
      [:id,:name,:sales_price,:retail_price]
    end

end