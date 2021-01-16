require 'rails_helper'

RSpec.describe GeocodingFacade, type: :facade do
  describe 'class methods' do
    describe '.latitude_longitude(location)', :vcr do
      it 'returns the latitude and longitude of a location' do
        location = GeocodingFacade.latitude_longitude('denver,co')

        expect(location).to be_a(Hash)
        expect(location).to have_key(:latitude)
        expect(location[:latitude]).to eq(39.738453)
        expect(location).to have_key(:longitude)
        expect(location[:longitude]).to eq(-104.984853)
      end
    end
  end
end
