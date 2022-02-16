class ImagesController < ApplicationController
  
  def index
    images = Image.all
    if params[:product_id]
      images = Image.where(product_id: params[:product_id])
    end
    render json: images
  end

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
