require 'rails_helper'

RSpec.describe Forecast, type: :poro do
  describe 'attributes', :vcr do
    let!(:data) { WeatherService.weather_data(latitude: 39.7392, longitude: -104.9903) }

    let(:current_weather) { CurrentWeather.new(data) }
    let(:daily_weather) { DailyWeather.new(data[:daily].first) }
    let(:hourly_weather) { HourlyWeather.new(data[:hourly].first) }

    let(:forecast) { Forecast.new(current_weather: current_weather, daily_weather: daily_weather, hourly_weather: hourly_weather) }

    it { expect(forecast).to be_a(Forecast) }

    it { expect(forecast.current_weather).to be_a(CurrentWeather) }
    it { expect(forecast.daily_weather).to be_a(DailyWeather) }
    it { expect(forecast.hourly_weather).to be_a(HourlyWeather) }
  end
end
