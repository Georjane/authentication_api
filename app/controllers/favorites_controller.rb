class FavoritesController < ApplicationController
  before_action :authenticate_request!
  def index
    favorites = Favorite.all
    json_response(favorites)
  end

  def create
    favorite = current_user!.favorites.create!(hotel_id: params[:hotel_id])
    if favorite.save
      json_response(favorite, :created)
    end
  end
end
