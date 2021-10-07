RSpec.describe 'Sessions', type: :request do
  describe 'POST /sessions' do
    let(:user) { FactoryBot.create(:user, username: 'user1', email: 'user2@gmail.com', password: 'password', password_confirmation: 'password') }
    it 'authenticates the user' do
      post '/sessions', params: { username: user.username, password: 'password' }
      expect(response).to have_http_status(:created)
      expect(json).to eq({
                           'id' => user.id,
                           'username' => 'user1',
                           'email' => 'user2@gmail.com',
                           'token' => AuthenticationTokenService.call(user.id)
                         })
    end
    it 'returns error when username does not exist' do
      post '/sessions', params: { username: 'ac', password: 'password' }
      expect(response).to have_http_status(:unauthorized)
      expect(json).to eq({
                           'error' => 'No such user'
                         })
    end
    it 'returns error when password is incorrect' do
      post '/sessions', params: { username: user.username, password: 'incorrect' }
      expect(response).to have_http_status(:unauthorized)
      expect(json).to eq({
                           'error' => 'Incorrect password '
                         })
    end
  end
 end