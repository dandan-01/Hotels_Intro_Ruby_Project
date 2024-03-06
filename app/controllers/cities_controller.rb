class CitiesController < ApplicationController
  def index
    #@cities = City.all
    @cities = City.page(params[:page]).per(50) #add new page per 50 rows
  end

  def show
    @city = City.find(params[:id])
    @hotel_count = @city.hotels.count # count number of hotels in city
  end
end
