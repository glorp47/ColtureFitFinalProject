class Api::FansController < ApplicationController

  def index
    @fans = Fan.all
    render :index
  end

  def show
    @fan = Fan.find(params[:id])
    render :show
  end

  def create
    fan = Fan.create!(fan_params)
    render json: fan
  end

  def update
    fan = Fan.update!(fan_params)
    render json: fan
  end

  private

  def fan_params
    params.require(:fan).permit(:password, :email, :location_zip, :account_type, :short_bio, :long_bio, :username)
  end


end
