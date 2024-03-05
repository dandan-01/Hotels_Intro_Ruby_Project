class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    @hotel_count = @city.hotels.count # count number of hotels in city
  end
end
