require 'rails_helper'

RSpec.describe 'Hotels', type: :request do
  let!(:hotels) { create_list(:hotel, 1) }
  let(:hotel) {FactoryBot.create(:hotel, title: 'This is the hotel title', description: 'This is the hotel desc', image_url: 'img.url')}
  let!(:hotel_id) { hotels.first.id }
  let(:user) { FactoryBot.create(:user, username: 'user1', email: 'user1@gmail.com', password: 'password') }

  describe 'GET /hotels' do
    # before { get '/hotels', headers: { withCredentials: true } }
    before { get '/hotels' }
    it 'returns hotels' do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /hotels/:id' do
    before { get "/hotels/#{hotel_id}" }
    # before { get "/hotels/#{hotel_id}", headers: { withCredentials: true } }
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
    # describe 'POST /hotels/:id' do
    let(:valid_attributes) do
      { title: 'Hotel name', description: 'Hotel description', image_url: 'image.png', user_id: user.id }
    end
    context 'when request attributes are valid' do
      before { post '/hotels', params: valid_attributes }
      # before { post '/hotels', params: valid_attributes, headers: { withCredentials: true } }
      # it 'returns status code 201' do
      #   expect(response).to have_http_status(201)
      # end
      it 'creates a hotel' do
        puts 'json============='
        puts json
        puts 'json================'
        expect(json['title']).to eq('Hotel name')
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
    context 'when an invalid request' do
      # before { post '/hotels', params: {}, headers: { withCredentials: true } }
      before { post '/hotels', params: { title: ' '} }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a validation failure message' do
        expect(response.body)
       .to include("is too short (minimum is 3 characters)")
      end
    end
  end
end
