class Api::ImagesController < ApplicationController

  def index
    @images = Image.all
    render :index
  end

  def show
    @image = Image.find(params[:id])
    render json: image
  end

  def create
    image = Image.create!(image_params)
    render json: image
  end

  def update
    image = Image.update!(image_params)
    render json: image
  end


  private

  def image_params
    params.require(:image).permit(:fan_id, :title, :long_bio, :date_made, :link_src)
  end

end
