# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DailyWeather, type: :poro do
  describe 'attributes', :vcr do
    let(:data) { WeatherService.weather_data(latitude: 39.7392, longitude: -104.9903) }
    let(:daily_weather) { DailyWeather.new(data[:daily].first) }

    it { expect(daily_weather).to be_a(DailyWeather) }

    it { expect(daily_weather.date).to be_a(String) }
    it { expect(daily_weather.sunrise).to be_a(String) }
    it { expect(daily_weather.sunset).to be_a(String) }
    it { expect(daily_weather.max_temp).to be_a(Numeric) }
    it { expect(daily_weather.min_temp).to be_a(Numeric) }
    it { expect(daily_weather.conditions).to be_a(String) }
    it { expect(daily_weather.icon).to be_a(String) }
  end
end
