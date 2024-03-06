class HotelsController < ApplicationController
  def index
    #@hotels = Hotel.all

    if params[:search].present?
      # Search and paginate the results
      @hotels = Hotel.where('name LIKE ?', "%#{params[:search]}%")
                     .page(params[:page]).per(50)
    else
      # Just paginate without search
      @hotels = Hotel.page(params[:page]).per(50)
    end
  end

  def show
    @hotel = Hotel.find(params[:id])
    @latitude = @hotel.latitude
    @longitude = @hotel.longitude
  end
end
