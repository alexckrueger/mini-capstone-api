Rails.application.routes.draw do

  get "/black_market" => "products#black_market_method"

  get "black_market/:product" => "products#product"

  get "black_market_product" => "products#find_product"

end