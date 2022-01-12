class ProductsController < ApplicationController

  def black_market_method
    products = Product.all
    render json: products.as_json
  end


end
