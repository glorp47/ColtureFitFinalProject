class Api::VideosController < ApplicationController

  def index
    @videos = Video.all
    render :index
  end

  def show
    @video = Video.find(params[:id])
    render json: video
  end

  def create
    video = Video.create!(video_params)
    render json: video
  end

  def update
    video = Video.update!(video_params)
    render json: video
  end

  private

  def video_params
    params.require(:video).permit(:fan_id, :album_id, :title, :long_bio, :date_made)
  end

end
