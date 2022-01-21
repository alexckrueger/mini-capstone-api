class ProductsController < ApplicationController

  def index
    products = Product.all

    if params[:search]
      products = products.where("name iLIKE ?", "%#{params[:search]}%")
    end

    if params[:sort] 
      products = products.order(:price)
      if params[:sort_order] == "desc"
        products = products.reverse
      end
    else
      product = product.order(:id)
    end

    if params[:discount] == "true"
      products = products.where("price < 10")
    end

    render json: products
  end

  def show
    product = Product.find(params[:id])
    render json: product
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
      quantity: params[:quantity]      
    )

    if product.save
      render json: product
    else
      render json: {errors: product.errors.full_messages, message: "You make me sad."}, status: 422
    end
  end

  def update
    product = Product.find(params[:id])

    product.name = params[:name] || product.name
    product.price = params[:price] || product.price
    product.image_url = params[:image_url] || product.image_url
    product.description = params[:description] || product.description
    product.quantity = params[:quantity] || product.quantity

    if product.save
      render json: product
    else
      render json: {errors: product.errors.full_messages, message: "You make me sad."}, status: 422
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    render json: {message: "Product successfully obliterated."}
  end

end
