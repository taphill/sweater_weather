require 'rails_helper'

RSpec.describe PhotoService, type: :service do
  describe 'class methods' do
    describe '.background_image_data(location)', :vcr do
      let(:json) { PhotoService.background_image_data('denver,co') }

      it 'returns json data' do
        expect(json).to be_a(Hash)

        expect(json).to have_key(:results)
        expect(json[:results]).to be_a(Array)
        expect(json[:results].length).to eq(1)

        expect(json[:results].first).to have_key(:urls)
        expect(json[:results].first[:urls]).to be_a(Hash)
        expect(json[:results].first[:urls]).to have_key(:raw)
        expect(json[:results].first[:urls][:raw]).to be_a(String)

        expect(json[:results].first).to have_key(:user)
        expect(json[:results].first[:user]).to be_a(Hash)
        expect(json[:results].first[:user]).to have_key(:name)
        expect(json[:results].first[:user][:name]).to be_a(String)
        expect(json[:results].first[:user]).to have_key(:links)
        expect(json[:results].first[:user][:links]).to be_a(Hash)
        expect(json[:results].first[:user][:links]).to have_key(:html)
        expect(json[:results].first[:user][:links][:html]).to be_a(String)
      end
    end
  end
end
