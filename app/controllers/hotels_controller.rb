class HotelsController < ApplicationController
  def index
    #@hotels = Hotel.all
    @hotels = Hotel.page(params[:page]).per(50) #add new page per 50 rows
  end

  def show
    @hotel = Hotel.find(params[:id])
    @latitude = @hotel.latitude
    @longitude = @hotel.longitude
  end
end
