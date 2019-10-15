class ProductsController < ApplicationController

  include ProductsHelper

  def search
    head(:not_found) unless params[:name].present?

    @products = search_by_product(params[:name])
    
    if @products.present?
      searchable_attribs.each do |attr|
        value = attr.to_sym
        @products = search_by(attr,@products,params[value]) if params[value]
      end
    end

    render json: @products
  end

  private

    def search_by(attr,from,value)
      if searchable_attribs.include? attr
        send("search_by_#{attr}",from,"#{value}")
      else
        head(:not_found)
      end
    end

end