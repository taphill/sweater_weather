require 'rails_helper'

RSpec.describe GeocodingService, type: :service do
  describe 'class methods' do
    describe '.location(location)', :vcr do
      let(:json) { GeocodingService.location('denver,co') } 

      it { expect(json).to be_a(Hash) }

      it { expect(json).to have_key(:results) }
      it { expect(json[:results]).to be_a(Array) }

      it { expect(json[:results].length).to eq(1) }
      it { expect(json[:results].first).to have_key(:locations) }
      it { expect(json[:results].first[:locations]).to be_a(Array) }

      it { expect(json[:results].first[:locations].first).to have_key(:latLng) }
      it { expect(json[:results].first[:locations].first[:latLng]).to be_a(Hash) }

      it { expect(json[:results].first[:locations].first[:latLng]).to have_key(:lat) }
      it { expect(json[:results].first[:locations].first[:latLng][:lat]).to be_a(Float) }

      it { expect(json[:results].first[:locations].first[:latLng]).to have_key(:lng) }
      it { expect(json[:results].first[:locations].first[:latLng][:lng]).to be_a(Float) }
    end
  end
end
