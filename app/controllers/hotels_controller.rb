class HotelsController < ApplicationController
  before_action :set_hotel, only: %i[show update destroy]
  def index
    @hotels = Hotel.all
    # if @current_user
    # @hotels = @current_user.hotels
    #   json_response(@hotels)
    # else
    # @hotels = Hotel.all
    json_response(@hotels)
    # end
  end

  def create
    @hotel = Hotel.create(hotel_params)
    json_response(@hotel, :created)
  end

  def show
    json_response(@hotel)
  end

  def destroy
    @hotel.destroy
    head :no_content
  end

  private

  def hotel_params
    params.permit(:title, :description, :image_url, :user_id)
  end

  def set_hotel
    @hotel = Hotel.find(params[:id])
  end
end
