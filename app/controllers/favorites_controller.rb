class FavoritesController < ApplicationController
  before_action :set_favorite, only: %i[show update destroy]
  def index
    @favorites = Favorite.all
    json_response(@favorites)
  end

  def create
    @favorite = Favorite.create(favorite_params)
    json_response(@favorite, :created)
  end

  def show
    json_response(@favorite)
  end

  def destroy
    @favorite.destroy
    head :no_content
  end

  private

  def favorite_params
    params.permit(:user_id, :hotel_id)
  end

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end
end
