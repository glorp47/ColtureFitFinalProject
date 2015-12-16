class Api::VenuesController < ApplicationController

  def index
    @venues = Venue.all
    render :index
  end

  def show
    @venue = Venue.find(params[:id])
    render json: venue
  end

  def create
    venue = Venue.create!(venue_params)
    render json: venue
  end

  def update
    venue = Venue.update!(venue_params)
    render json: venue
  end

  private

  def venue_params
    params.require(:venue).permit(:fan_id, :geo_lat, :geo_lng, :address)
  end

end
