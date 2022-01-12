Rails.application.routes.draw do

  get "/black_market" => "products#black_market_method"

  get "/black_market_liver" => "products#liver"

  get "/black_market_heart" => "products#heart"

  get "/black_market_kidney" => "products#kidney"

  get "/black_market_brain" => "products#brain"

end