# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api/V1/Road trip request', type: :request do
  describe 'POST /api/v1/road_trip', :vcr do
    let(:json_body) { JSON.parse(response.body, symbolize_names: true) }

    context 'when valid' do
      let(:user) { create(:user) }

      before do
        post api_v1_road_trip_index_path,
             params: { origin: 'denver,co', destination: 'nashville,tn', api_key: user.api_key }
      end

      it { expect(response.status).to eq(200) }

      it { expect(json_body).to be_a(Hash) }
      it { expect(json_body).to have_key(:data) }
      it { expect(json_body[:data]).to be_a(Hash) }
      it { expect(json_body[:data]).to have_key(:id) }
      it { expect(json_body[:data][:id]).to be_nil }
      it { expect(json_body[:data]).to have_key(:type) }
      it { expect(json_body[:data][:type]).to eq('roadtrip') }
      it { expect(json_body[:data]).to have_key(:attributes) }
      it { expect(json_body[:data][:attributes]).to be_a(Hash) }

      it { expect(json_body[:data][:attributes]).to have_key(:start_city) }
      it { expect(json_body[:data][:attributes][:start_city]).to be_a(String) }
      it { expect(json_body[:data][:attributes]).to have_key(:end_city) }
      it { expect(json_body[:data][:attributes][:end_city]).to be_a(String) }
      it { expect(json_body[:data][:attributes]).to have_key(:travel_time) }
      it { expect(json_body[:data][:attributes][:travel_time]).to be_a(String) }

      it { expect(json_body[:data][:attributes]).to have_key(:weather_at_eta) }
      it { expect(json_body[:data][:attributes][:weather_at_eta]).to be_a(Hash) }
      it { expect(json_body[:data][:attributes][:weather_at_eta]).to have_key(:temperature) }
      it { expect(json_body[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Numeric) }
      it { expect(json_body[:data][:attributes][:weather_at_eta]).to have_key(:conditions) }
      it { expect(json_body[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String) }
    end

    context 'when unauthorized' do
      before do
        post api_v1_road_trip_index_path,
             params: { origin: 'denver,co', destination: 'nashville,tn', api_key: 'osdua2Hsu2axr2hd' }
      end

      it { expect(response.status).to eq(401) }

      it { expect(json_body).to be_a(Hash) }
      it { expect(json_body).to have_key(:message) }
      it { expect(json_body[:message]).to eq('Unauthorized request') }
    end
  end
end
