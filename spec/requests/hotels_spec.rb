require 'rails_helper'

RSpec.describe 'Hotels', type: :request do
  let!(:hotels) { create_list(:hotel, 1) }
  let!(:hotel_id) { hotels.first.id }
  let(:user) { FactoryBot.create(:user, username: 'myusername', email: 'user1@gmail.com', password: 'password') }
  describe 'GET /hotels' do
    before { get '/hotels', headers: { withCredentials: true } }
    it 'returns hotels' do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /hotels/:id' do
    before { get "/hotels/#{hotel_id}", headers: { withCredentials: true } }
    context 'when hotel exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
      it 'returns the hotel item' do
        expect(json['id']).to eq(hotel_id)
      end
    end
  end

  describe 'POST /hotels/:id' do
    let(:valid_attributes) do
      { title: 'Hotel name', description: 'Hotel description', image_url: 'image.png' }
    end
    context 'when request attributes are valid' do
      before { post '/hotels', params: valid_attributes, headers: { withCredentials: true } }
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
    context 'when an invalid request' do
      before { post '/hotels', params: {}, headers: { withCredentials: true } }
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end
end
