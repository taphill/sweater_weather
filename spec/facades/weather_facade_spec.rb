# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeatherFacade, type: :facade do
  describe 'class methods' do
    describe '.forecast(latitude, longitude)', :vcr do
      it 'returns a forecast object' do
        forecast = WeatherFacade.forecast(latitude: 39.7392, longitude: -104.9903)

        expect(forecast).to be_a(Forecast)

        expect(forecast.current_weather).to be_a(CurrentWeather)
        expect(forecast.daily_weather).to be_a(Array)
        expect(forecast.daily_weather.first).to be_a(DailyWeather)
        expect(forecast.hourly_weather).to be_a(Array)
        expect(forecast.hourly_weather.first).to be_a(HourlyWeather)
      end
    end

    describe '.max_hourly(latitude, longitude)', :vcr do
      it 'returns an array of the next 48 hours of weather' do
        hourly_weather = WeatherFacade.max_hourly(latitude: 39.7392, longitude: -104.9903)

        expect(hourly_weather).to be_a(Array)
        expect(hourly_weather.length).to eq(48)
        expect(hourly_weather.first).to be_a(HourlyWeather)
      end
    end
  end
end
