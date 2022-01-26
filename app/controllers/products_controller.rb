class ProductsController < ApplicationController

  before_action :authenticate_admin, except: [:index, :show]

  def index
    products = Product.all
    .title_search(params[:search])
    .discounted(params[:discount])
    .sorted(params[:sort], params[:sort_order])
    render json: products
  end

  def show
    product = Product.find(params[:id])
    render json: {product: product, current_user: current_user}
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      quantity: params[:quantity],
      supplier_id: params[:supplier_id]      
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
