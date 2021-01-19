require 'rails_helper'

RSpec.describe MunchiesFacade, type: :facade do
  describe 'class methods' do
    describe '.create_munchie(start, end_location, food)' do
      it 'returns a munchi object' do
        munchie = MunchiesFacade.create_munchie(start: 'denver,co', end_location: 'pueblo,co', food: 'mexican')

        expect(munchie).to be_a(Image)
        expect(munchie.destination_city).to be_a(String)
        expect(munchie.travel_time).to be_a(String)
        expect(munchie.forecast).to be_a(Hash)
        expect(munchie.restaurant).to be_a(Hash)
      end
    end
  end
end
