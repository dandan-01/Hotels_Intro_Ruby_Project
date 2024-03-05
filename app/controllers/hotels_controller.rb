class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
  end

  def show
    @hotel = Hotel.find(params[:id])
    @latitude = @hotel.latitude
    @longitude = @hotel.longitude
  end
end
