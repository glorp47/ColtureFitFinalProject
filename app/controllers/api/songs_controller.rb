class Api::SongsController < ApplicationController

  def index
    @songs = Song.all
    render :index
  end

  def show
    @song = Song.find(params[:id])
    render json: song
  end

  def create
    song = Song.create!(song_params)
    render json: song
  end

  def update
    song = Song.update!(song_params)
    render json: song
  end


  private

  def song_params
    params.require(:song).permit(:band_id, :album_id, :title, :long_bio, :date_made, :link_src)
  end

end
