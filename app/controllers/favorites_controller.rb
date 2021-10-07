class FavoritesController < ApplicationController
  before_action :authenticate_request!
  before_action :set_favorite, only: %i[show update destroy]
  def index
    @favorites = Favorite.all
    json_response(@favorites)
  end

  def create
    @favorite = current_user!.favorites.create(favorite_params)
    if @favorite.save
      json_response(@favorite, :created)
    end
    # @favorite = Favorite.create(favorite_params)
    # json_response(@favorite, :created)
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
