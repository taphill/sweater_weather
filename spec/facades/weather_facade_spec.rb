# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeatherFacade, type: :facade do
  describe 'class methods' do
    describe '.weather_data(latitude, longitude)', :vcr do
      it 'returns the latitude and longitude of a location' do
      end
    end
  end
end
