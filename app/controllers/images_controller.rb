class ImagesController < ApplicationController
  def create
    image = Image.new(
      url: params[:url],
      product_id: params[:product_id]
    )
    if image.save
      render json: image
    else
      render json: {message: "oi you didn't do it bafoon"}
    end
  end
end
