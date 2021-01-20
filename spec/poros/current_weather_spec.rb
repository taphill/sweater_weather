# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CurrentWeather, type: :poro do
  describe 'attributes', :vcr do
    let!(:data) { WeatherService.weather_data(latitude: 39.7392, longitude: -104.9903) }

    let(:current_weather) { CurrentWeather.new(data) }

    it { expect(current_weather).to be_a(CurrentWeather) }

    it { expect(current_weather.datetime).to be_a(String) }
    it { expect(current_weather.sunrise).to be_a(String) }
    it { expect(current_weather.sunset).to be_a(String) }
    it { expect(current_weather.temperature).to be_a(Numeric) }
    it { expect(current_weather.feels_like).to be_a(Numeric) }
    it { expect(current_weather.uvi).to be_a(Numeric) }
    it { expect(current_weather.visibility).to be_a(Numeric) }
    it { expect(current_weather.conditions).to be_a(String) }
    it { expect(current_weather.icon).to be_a(String) }
  end
end
