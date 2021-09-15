require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST /registrations' do
    it 'authenticates the user' do
      post '/registrations',
           params: { user: { username: 'user1', email: 'user@gmail.com', password: 'password',
                             password_confirmation: 'password' } }
      expect(response).to have_http_status(:ok)
    end
  end
end
