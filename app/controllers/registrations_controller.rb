class RegistrationsController < ApplicationController
  def create
    user = User.create!(
      username: params['user']['username'],
      email: params['user']['email'],
      password: params['user']['password'],
      password_confirmation: params['user']['password_confirmation']
    )

    if user
      session[:user_id] = user.id
      user_info = {
        "user": user[:username],
        "email": user[:email]
      }
      render json: {
        status: :created,
        user: user_info
      }
    else
      render json: { status: 422 }
    end
  end
end
