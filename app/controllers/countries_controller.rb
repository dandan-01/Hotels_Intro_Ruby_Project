class CountriesController < ApplicationController
  def index
    @countries = Country.all
  end

  def show
    @country = Country.find(params[:id])
    @cities = @country.cities
    @hotels = @country.hotels
    @city_count = @cities.count
    @hotel_count = @hotels.count
  end
end
