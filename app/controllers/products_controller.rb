class ProductsController < ApplicationController

  def black_market_method
    products = Product.all
    render json: products.as_json
  end

  def liver
    products = Product.find_by(name: "liver")
    render json: products.as_json
  end

  def heart
    products = Product.find_by(name: "heart")
    render json: products.as_json
  end

  def kidney
    products = Product.find_by(name: "kidney")
    render json: products.as_json
  end

  def brain
    products = Product.find_by(name: "brain")
    render json: products.as_json
  end

end
