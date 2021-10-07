class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  include Response

  def authenticate_request!
    puts '-------------payload'
    puts !payload
    puts '------------------payload'
    return invalid_authentication if !payload || !AuthenticationTokenService.valid_payload(payload.first)
    puts '-------------payload'
    puts current_user!
    puts '------------------payload'
    current_user!
    invalid_authentication unless @current_user
  end

  def current_user!
    @current_user = User.find_by(id: payload[0]['user_id'])
  end

  private
  def payload
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ').last
    puts token
    AuthenticationTokenService.decode(token)
    # if err
    #   nil
    # end
    # nil
  end

  def invalid_authentication
    render json: { error: 'You will need to login first' }, status: 422
  end
end
