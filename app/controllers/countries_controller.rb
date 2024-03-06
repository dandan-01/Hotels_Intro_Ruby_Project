class CountriesController < ApplicationController
  def index
    #@countries = Country.all
    @countries = Country.page(params[:page]).per(50) #add new page per 50 rows
  end

  def show
    @country = Country.find(params[:id])
    @cities = @country.cities
    @city_count = @cities.count

    # Fetch the hotels using the FK city_id and the pluck() method
    # @cities.pluck(): extracts an array of city IDs from the @cities collection. It retrieves just the IDs
    @hotels = Hotel.where(city_id: @cities.pluck(:id))
    @hotel_count = @hotels.count
  end
end
