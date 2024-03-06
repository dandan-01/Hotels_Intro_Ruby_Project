class HomeController < ApplicationController
  def index
    #show hotel and attraction info in home page
    @hotels = Hotel.limit(200) #limit to 200 so it loads up more quickly
    @attractions = Attraction.all
  end
end
