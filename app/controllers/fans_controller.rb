class FansController < ApplicationController

  def new
    @fan = Fan.new
  end

  def create
    @fan = Fan.new(fan_params)
    fail
    if @fan.save
      sign_in!(@fan)
      redirect_to root
    else
      flash.now[:errors] = @fan.errors.full_messages
      render :new
    end
  end

  private
  def fan_params
    params.require(:fan).permit(:password, :email, :location_zip, :account_type, :username)
  end

end
