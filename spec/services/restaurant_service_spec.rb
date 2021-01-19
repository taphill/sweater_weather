require 'rails_helper'

RSpec.describe RestaurantService, type: :service do
  describe 'class methods' do
    describe '.find(location, term, open_at)', :vcr do
      let(:json) { RestaurantService.find(location: 'pueblo,co', term: 'mexican', open_at: Time.now.getlocal.to_i) }

      it { expect(json).to be_a(Hash) }

      it { expect(json).to have_key(:businesses) }
      it { expect(json[:businesses]).to be_a(Array) }

      it { expect(json[:businesses].first).to have_key(:name) }
      it { expect(json[:businesses].first[:name]).to be_a(String) }

      it { expect(json[:businesses].first).to have_key(:location) }
      it { expect(json[:businesses].first[:location]).to be_a(Hash) }

      it { expect(json[:businesses].first[:location]).to have_key(:display_address) }
      it { expect(json[:businesses].first[:location][:display_address]).to be_a(Array) }
      it { expect(json[:businesses].first[:location][:display_address].first).to be_a(String) }
      it { expect(json[:businesses].first[:location][:display_address].last).to be_a(String) }
    end
  end
end
