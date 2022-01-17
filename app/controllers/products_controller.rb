class ProductsController < ApplicationController

  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    product = params[:id]
    product_info = Product.find_by(id: product)
    render json: product_info.as_json(methods: [:is_discounted?, :tax, :total])
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description]      
    )
    product.save
    render json: product
  end

  def update
    product = Product.find(params[:id])
    product.name = params[:name] || product.name
    product.price = params[:price] || product.price
    product.image_url = params[:image_url] || product.image_url
    product.description = params[:description] || product.description
    product.save
    render json: product
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    render json: {message: "Product successfully obliterated."}
    
  end

end
