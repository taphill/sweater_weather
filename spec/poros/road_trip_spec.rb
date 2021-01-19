require 'rails_helper'

RSpec.describe RoadTrip, type: :poro do
  describe 'attributes' do
    let(:road_trip){ RoadTrip.new(
      start_city: 'denver,co',
      end_city: 'pueblo,co',
      travel_time: '1 hour(s) 51 minutes',
      weather_at_eta: { temperature: '65', conditions: 'Cloudy' }
    )}

    it { expect(road_trip).to be_a(RoadTrip) }

    it { expect(road_trip.start_city).to be_a(String) }
    it { expect(road_trip.end_city).to be_a(String) }
    it { expect(road_trip.travel_time).to be_a(String) }

    it { expect(road_trip.weather_at_eta).to be_a(Hash) }
    it { expect(road_trip.weather_at_eta).to have_key(:temperature) }
    it { expect(road_trip.weather_at_eta[:temperature]).to be_a(String) }
    it { expect(road_trip.weather_at_eta).to have_key(:conditions) }
    it { expect(road_trip.weather_at_eta[:conditions]).to be_a(String) }
  end
end
