# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Munchie, type: :poro do
  it 'has attributes' do
    munchie = Munchie.new(
      destination: 'pueblo,co',
      travel_time: '1 hour(s) 45 min',
      forecast: { summary: 'Cloudy', temperature: '65' },
      restaurant: { name: 'Mexican Restaurant', address: '4602 N. Elizabeth St, Ste 120, Pueblo, CO 81008' }
    )

    expect(munchie.destination_city).to eq('pueblo,co')
    expect(munchie.travel_time).to eq('1 hour(s) 45 min')
    expect(munchie.forecast).to be_a(Hash)
    expect(munchie.restaurant).to be_a(Hash)
  end
end
