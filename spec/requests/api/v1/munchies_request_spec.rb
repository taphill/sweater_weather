# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api/V1/Munchies request', type: :request do
  describe 'GET /api/v1/munchies' do
    let(:json_body) { JSON.parse(response.body, symbolize_names: true) }

    before do
      get api_v1_munchies_path,
          params: { start: 'denver,co', end_location: 'pueblo,co', food: 'mexican' }
    end

    it 'has data' do
      expect(response.status).to eq(200)

      expect(json_body).to be_a(Hash)
      expect(json_body).to have_key(:data)
      expect(json_body[:data]).to be_a(Hash)
      expect(json_body[:data]).to have_key(:id)
      expect(json_body[:data][:id]).to be_nil
      expect(json_body[:data]).to have_key(:type)
      expect(json_body[:data][:type]).to eq('munchie')

      expect(json_body[:data][:attributes]).to have_key(:destination_city)
      expect(json_body[:data][:attributes][:destination_city]).to be_a(String)
      expect(json_body[:data][:attributes]).to have_key(:travel_time)
      expect(json_body[:data][:attributes][:travel_time]).to be_a(String)

      expect(json_body[:data][:attributes]).to have_key(:forecast)
      expect(json_body[:data][:attributes][:forecast]).to be_a(Hash)
      expect(json_body[:data][:attributes][:forecast]).to have_key(:summary)
      expect(json_body[:data][:attributes][:forecast][:summary]).to be_a(String)
      expect(json_body[:data][:attributes][:forecast]).to have_key(:temperature)
      expect(json_body[:data][:attributes][:forecast][:temperature]).to be_a(String)

      expect(json_body[:data][:attributes]).to have_key(:restaurant)
      expect(json_body[:data][:attributes][:restaurant]).to be_a(Hash)
      expect(json_body[:data][:attributes][:restaurant]).to have_key(:name)
      expect(json_body[:data][:attributes][:restaurant][:name]).to be_a(String)
      expect(json_body[:data][:attributes][:restaurant]).to have_key(:address)
      expect(json_body[:data][:attributes][:restaurant][:address]).to be_a(String)
    end

    it 'has sad path' do
    end
  end
end
