class FavoritesController < ApplicationController
  before_action :authenticate_request!
  def index
    favorites = Favorite.all
    json_response(favorites)
  end

  def create
    favorite = current_user!.favorites.create!(hotel_id: params[:hotel_id])
    json_response(favorite, :created) if favorite.save
  end
end
