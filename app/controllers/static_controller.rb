class StaticController  < ApplicationController
  def home
    render json: { status: ' Its working' }
  end
end