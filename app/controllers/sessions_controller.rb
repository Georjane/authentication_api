class SessionsController < ApplicationController
  def create
    if user && user.authenticate(params.require(:password))
      render json: UserRepresenter.new(user).as_json, status: :created
    else
      render json: { status: 401 } 
    end
  end

  private
  def user
    @user ||= User.find_by(username: params.require(:username))
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
    reset_session
    render json: { status: 200, loggout_out: true }
  end
end
