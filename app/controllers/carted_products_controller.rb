class CartedProductsController < ApplicationController

  def index
    carted_products = current_user.carted_products
    render json: carted_products
  end

  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
      order_id: nil
    )
    if carted_product.save
      render json: carted_product
    else
      render json: {errors: carted_product.errors.full_messages}
    end
  end

  def destroy
    carted_product = CartedProduct.find(params[:id])
    carted_product.status = "removed"
    carted_product.save
    render json: {message: "obliterated."}
  end

end
