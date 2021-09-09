class FavoritesController  < ApplicationController
  before_action :set_favorite, only: [:show, :update, :destroy]
  def index
    # @favorites = Favorite.all.map(&:hotel)
    # if @current_user
      @favorites = @current_user.favorites.map(&:hotel)
      # @favorites = @current_user.favorites
      # @hotels = @favorites.find_by(hotel_id: params["user"]["email"])
    #   json_response(@favorites)
    # else
      # @favorites = favorite.all
      json_response(@favorites)
    # end
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
    params.permit(:user_id, :hotel)
  end

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end
end