require 'rails_helper'

RSpec.describe 'Authentications', type: :request do
  describe 'POST /sessions' do
    let(:user) { FactoryBot.create(:user, username: 'user1', email: 'user1@gmail.com', password: 'password') }
    it 'authenticates the user' do
      post '/sessions', params: { user: { username: 'user1', email: 'user1@gmail.com', password: 'password' } }
      # expect(response).to have_http_status(:created)
      expect(json).to eq({
                           status: :created,
                           logged_in: true,
                           user: user
                         })
    end
    it 'returns error when username does not exist' do
      post '/sessions', params: { username: 'ac', password: 'password' }
      expect(response).to have_http_status(:unauthorized)
      expect(json).to eq({ status: 401 })
    end
    it 'returns error when password is incorrect' do
      post '/sessions', params: { username: user.username, email: user.email, password: 'incorrect' }
      expect(response).to have_http_status(:unauthorized)
      expect(json).to eq({ status: 401 })
    end
  end
end
