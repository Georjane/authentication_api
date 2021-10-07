class RegistrationsController < ApplicationController
  def create
    user = User.create!(user_params)
    if user.save
      render json: UserRepresenter.new(user).as_json, status: :created
    else
      render json: { error: user.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
  # def create
  #   user = User.create!(
  #     username: params['user']['username'],
  #     email: params['user']['email'],
  #     password: params['user']['password'],
  #     password_confirmation: params['user']['password_confirmation']
  #   )

  #   if user
  #     session[:user_id] = user.id
  #     user_info = {
  #       id: user[:id],
  #       user: user[:username],
  #       email: user[:email]
  #     }
  #     render json: {
  #       status: :created,
  #       user: user_info
  #     }
  #   else
  #     render json: { status: 422 }
  #   end
  # end
end
