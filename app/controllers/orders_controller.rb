class OrdersController < ApplicationController
  before_action :authenticate_user, except: [:show]

  def index
    if current_user
      orders = current_user.orders
      render json: orders
    else
      render json: {message: "log in fool"}, status: :unauthorized
    end
  end

  def create
    if current_user
      carted_order = current_user.carted_products.where(status: "carted")

      subtotal = 0
      carted_order.each do |carted_product|
        subtotal += (carted_product.product.price * carted_product.quantity)
      end

      order = Order.new(
        user_id: current_user.id,
        subtotal: subtotal,
        tax: subtotal * 0.09,
        total: subtotal + (subtotal + 0.09)
      )

      order.save  # price should be $12,110 if i did this right

      carted_order.each do |carted_product|
        carted_product.status = "purchased"
        carted_product.order_id = order.id
        carted_product.save
      end

      render json: order
    else
      render json: {message: "log in fool"}, status: :unauthorized
    end
  end

  def show
    order = current_user.orders.find(params[:id])
    render json: order
  end

end


# I wrote all of the above last excersize cause I got confused

# 1. create an order controller 
# 2. In routes.rb, create a route that goes to orders#create
# 3. In orders_controller.rb, def-tab-for-cutie that create method
#   3a. AKA create a create method for orders
# 4. Decide what parameters will be sent in the web request
#   4a. In this case, I am assuming we will send quantity and product_id via params
# 5. in the create method, find the product using the product_id and assign it to a variable
# 6. call Order.new and assign the following variables:
#     6a. quantity comes from params
#     6b. product_id, subtotal, tax, and total come from finding the product and calling upon its methods
#     6c. user_id comes from the web request
# 7. create happy and sad paths for the order
# 8. use requests.http to test it (probably should have done this a while ago tbh)