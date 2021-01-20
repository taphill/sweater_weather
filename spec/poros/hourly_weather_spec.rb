# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HourlyWeather, type: :poro do
  describe 'attributes', :vcr do
    let(:data) { WeatherService.weather_data(latitude: 39.7392, longitude: -104.9903) }
    let(:hourly_weather) { HourlyWeather.new(data[:hourly].first) }

    it { expect(hourly_weather).to be_a(HourlyWeather) }

    it { expect(hourly_weather.time).to be_a(String) }
    it { expect(hourly_weather.temperature).to be_a(Numeric) }
    it { expect(hourly_weather.wind_speed).to be_a(String) }
    it { expect(hourly_weather.wind_direction).to be_a(String) }
    it { expect(hourly_weather.conditions).to be_a(String) }
    it { expect(hourly_weather.icon).to be_a(String) }
  end
end
