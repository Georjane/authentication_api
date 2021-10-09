require 'rails_helper'

RSpec.describe 'Hotels', type: :request do
  let!(:hotels) { create_list(:hotel, 1) }
  let(:hotel) do
    FactoryBot.create(:hotel, title: 'This is the hotel title', description: 'This is the hotel desc',
                              image_url: 'img.url')
  end
  let!(:hotel_id) { hotels.first.id }
  let(:user) { FactoryBot.create(:user, username: 'user1', email: 'user1@gmail.com', password: 'password') }
  describe 'GET /hotels' do
    before { get '/hotels', headers: { 'Authorization' => AuthenticationTokenService.call(user.id) } }
    it 'returns hotels' do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /hotels/:id' do
    before { get "/hotels/#{hotel_id}", headers: { 'Authorization' => AuthenticationTokenService.call(user.id) } }
    context 'when hotel exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
      it 'returns the hotel item' do
        expect(json['id']).to eq(hotel_id)
      end
    end
  end

  describe 'POST /hotels' do
    let(:valid_attributes) do
      { title: 'Hotel name', description: 'Hotel description', image_url: 'image.png', user_id: user.id }
    end
    context 'when request attributes are valid' do
      before do
        post '/hotels', params: valid_attributes,
                        headers: { 'Authorization' => AuthenticationTokenService.call(user.id) }
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
    context 'when an invalid request' do
      before do
        post '/hotels', params: { title: ' ' }, headers: { 'Authorization' => AuthenticationTokenService.call(user.id) }
      end
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a validation failure message' do
        expect(response.body)
          .to include('is too short (minimum is 3 characters)')
      end
    end
  end
end
