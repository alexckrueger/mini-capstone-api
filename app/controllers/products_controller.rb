class ProductsController < ApplicationController

  def black_market_method
    products = Product.all
    render json: products.as_json
  end

  def product
    product = params[:product]
    product_info = Product.find_by(name: product)
    render json: product_info
  end

  def find_product
    product = params[:product]
    product_info = Product.find_by(name: product)
    render json: product_info
  end

end
