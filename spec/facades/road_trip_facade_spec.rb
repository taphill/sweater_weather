# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RoadTripFacade, type: :facade do
  describe 'class methods' do
    describe '.trip(origin, destination)', :vcr do
      it 'returns a road trip object when route is valid' do
        road_trip = RoadTripFacade.trip(origin: 'denver,co', destination: 'nashville,tn')

        expect(road_trip).to be_a(RoadTrip)
        expect(road_trip.start_city).to be_a(String)
        expect(road_trip.end_city).to be_a(String)
        expect(road_trip.travel_time).to be_a(String)
        expect(road_trip.weather_at_eta).to be_a(Hash)

        expect(road_trip.weather_at_eta).to have_key(:temperature)
        expect(road_trip.weather_at_eta[:temperature]).to be_a(Numeric)
        expect(road_trip.weather_at_eta).to have_key(:conditions)
        expect(road_trip.weather_at_eta[:conditions]).to be_a(String)
      end

      it 'returns a road trip object when route is not valid' do
        road_trip = RoadTripFacade.trip(origin: 'denver,co', destination: 'london,uk')

        expect(road_trip).to be_a(RoadTrip)
        expect(road_trip.start_city).to be_a(String)
        expect(road_trip.end_city).to be_a(String)
        expect(road_trip.travel_time).to eq('impossible route')
        expect(road_trip.weather_at_eta).to be_nil
      end

      it 'returns a road trip object when route is too long for weather eta' do
        road_trip = RoadTripFacade.trip(origin: 'new york city,ny', destination: 'fairbanks,ak')

        expect(road_trip).to be_a(RoadTrip)
        expect(road_trip.start_city).to be_a(String)
        expect(road_trip.end_city).to be_a(String)
        expect(road_trip.travel_time).to be_a(String)
        expect(road_trip.weather_at_eta).to be_nil
      end
    end
  end
end
