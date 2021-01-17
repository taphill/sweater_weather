# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api/V1/Forecast request', type: :request do
  describe 'GET /api/v1/forecast?location=', :vcr do
    let(:json_body) { JSON.parse(response.body, symbolize_names: true) }

    before { get api_v1_forecast_index_path, params: { location: 'denver,co' } }

    it { expect(response.status).to eq(200) }

    it { expect(json_body).to be_a(Hash) }
    it { expect(json_body).to have_key(:data) }
    it { expect(json_body[:data]).to be_a(Hash) }
    it { expect(json_body[:data]).to have_key(:id) }
    it { expect(json_body[:data][:id]).to be_nil }
    it { expect(json_body[:data]).to have_key(:type) }
    it { expect(json_body[:data][:type]).to eq('forecast') }

    it { expect(json_body[:data]).to have_key(:attributes) }
    it { expect(json_body[:data][:attributes]).to be_a(Hash) }
    it { expect(json_body[:data][:attributes]).to have_key(:current_weather) }
    it { expect(json_body[:data][:attributes][:current_weather]).to be_a(Hash) }
    it { expect(json_body[:data][:attributes]).to have_key(:daily_weather) }
    it { expect(json_body[:data][:attributes][:daily_weather]).to be_a(Array) }
    it { expect(json_body[:data][:attributes][:daily_weather].length).to eq(5) }
    it { expect(json_body[:data][:attributes]).to have_key(:hourly_weather) }
    it { expect(json_body[:data][:attributes][:hourly_weather]).to be_a(Array) }
    it { expect(json_body[:data][:attributes][:hourly_weather].length).to eq(8) }

    it 'has current weather attributes' do
      expect(json_body[:data][:attributes][:current_weather]).to have_key(:datetime)
      expect(json_body[:data][:attributes][:current_weather][:datetime]).to be_a(String)
      expect(json_body[:data][:attributes][:current_weather]).to have_key(:sunrise)
      expect(json_body[:data][:attributes][:current_weather][:sunrise]).to be_a(String)
      expect(json_body[:data][:attributes][:current_weather]).to have_key(:sunset)
      expect(json_body[:data][:attributes][:current_weather][:sunset]).to be_a(String)
      expect(json_body[:data][:attributes][:current_weather]).to have_key(:temperature)
      expect(json_body[:data][:attributes][:current_weather][:temperature]).to be_a(Float)
      expect(json_body[:data][:attributes][:current_weather]).to have_key(:feels_like)
      expect(json_body[:data][:attributes][:current_weather][:feels_like]).to be_a(Float)
      expect(json_body[:data][:attributes][:current_weather]).to have_key(:humidity)
      expect(json_body[:data][:attributes][:current_weather][:humidity]).to be_a(Integer)
      expect(json_body[:data][:attributes][:current_weather]).to have_key(:uvi)
      expect(json_body[:data][:attributes][:current_weather][:uvi]).to be_a(Float)
      expect(json_body[:data][:attributes][:current_weather]).to have_key(:visibility)
      expect(json_body[:data][:attributes][:current_weather][:visibility]).to be_a(Integer)
      expect(json_body[:data][:attributes][:current_weather]).to have_key(:conditions)
      expect(json_body[:data][:attributes][:current_weather][:conditions]).to be_a(String)
      expect(json_body[:data][:attributes][:current_weather]).to have_key(:icon)
      expect(json_body[:data][:attributes][:current_weather][:icon]).to be_a(String)
    end

    it 'has daily weather attributes' do
      json_body[:data][:attributes][:daily_weather].each do |day|
        expect(day).to have_key(:date)
        expect(day[:date]).to be_a(String)
        expect(day).to have_key(:sunrise)
        expect(day[:sunrise]).to be_a(String)
        expect(day).to have_key(:sunset)
        expect(day[:sunset]).to be_a(String)
        expect(day).to have_key(:max_temp)
        expect(day[:max_temp]).to be_a(Float)
        expect(day).to have_key(:min_temp)
        expect(day[:min_temp]).to be_a(Float)
        expect(day).to have_key(:conditions)
        expect(day[:conditions]).to be_a(String)
        expect(day).to have_key(:icon)
        expect(day[:icon]).to be_a(String)
      end
    end

    it 'has hourly weather attributes' do
      json_body[:data][:attributes][:hourly_weather].each do |hour|
        expect(hour).to have_key(:time)
        expect(hour[:time]).to be_a(String)
        expect(hour).to have_key(:temperature)
        expect(hour[:temperature]).to be_a(Float)
        expect(hour).to have_key(:wind_speed)
        expect(hour[:wind_speed]).to be_a(String)
        expect(hour).to have_key(:wind_direction)
        expect(hour[:wind_direction]).to be_a(String)
        expect(hour).to have_key(:conditions)
        expect(hour[:conditions]).to be_a(String)
        expect(hour).to have_key(:icon)
        expect(hour[:icon]).to be_a(String)
      end
    end
  end

  describe 'invalid GET /api/v1/forecast?location= request' do
    let(:json_body) { JSON.parse(response.body, symbolize_names: true) }

    context 'when passed an invalid location' do
      it 'returns a 404', :vcr do
        get api_v1_forecast_index_path, params: { location: 'bklaksjdfowlkjasdfjlqk' }
       
        expect(response.status).to eq(404) 
        expect(json_body).to have_key(:message)
        expect(json_body[:message]).to eq('Please ensure you entered a valid location')
      end
    end
  end
end
