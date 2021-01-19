# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MapService, type: :service do
  describe 'class methods' do
    describe '.location(location)', :vcr do
      let(:json) { MapService.geocode('denver,co') }

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

    describe '.route(origin, destination)', :vcr do
      let(:json) { MapService.route(origin: 'Denver, CO', destination: 'Nashville, TN') }

      it { expect(json).to be_a(Hash) }

      it { expect(json).to have_key(:distance) }
      it { expect(json[:distance]).to be_a(Array) }
      it { expect(json[:distance].first).to eq(0) }
      it { expect(json[:distance].last).to be_a(Float) }

      it { expect(json).to have_key(:time) }
      it { expect(json[:time]).to be_a(Array) }
      it { expect(json[:time].first).to eq(0) }
      it { expect(json[:time].last).to be_a(Integer) }
    end
  end
end
