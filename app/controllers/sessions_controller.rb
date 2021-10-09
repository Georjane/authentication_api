class SessionsController < ApplicationController
  class AuthenticateError < StandardError; end
  rescue_from ActionController::ParameterMissing, with: :parameter_missing
  rescue_from AuthenticateError, with: :handle_unauthenticated
  def create
    if user 
      raise AuthenticateError unless user.authenticate(params.require(:password))
      render json: UserRepresenter.new(user).as_json, status: :created
    else
      render json: { error: 'No such user' }, status: :unauthorized 
    end
  end

  private
  def user
    @user ||= User.find_by(username: params.require(:username))
  end
  def parameter_missing(error)
    puts '===================error'
    puts error
    puts '=================error'
    render json: { error: error.message }, status: :unprocessable_entity
  end
  def handle_unauthenticated
    render json: { error: 'Incorrect password ' }, status: :unauthorized
  end
  # def create
  #   user = User
  #     .find_by(username: params['user']['username'])
  #     .try(:authenticate, params['user']['password'])

  #   if user
  #     session[:user_id] = user.id
  #     user_info = {
  #       id: user[:id],
  #       user: user[:username],
  #       email: user[:email]
  #     }
  #     render json: {
  #       status: :created,
  #       logged_in: true,
  #       user: user_info
  #     }
  #   else
  #     render json: { status: 401 }
  #   end
  # end

  def destroy
    render json: { status: 200, loggout_out: true }
  end
end
