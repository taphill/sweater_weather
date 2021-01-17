require 'rails_helper'

RSpec.describe CurrentWeather, type: :poro do
  it 'has attributes', :vcr do
    current_weather = WeatherFacade.weather_data(latitude: 39.738453, longitude: -104.984853)

    expect(current_weather.datetime).to be_a(Time)
    expect(current_weather.sunrise).to be_a(Time)
    expect(current_weather.sunset).to be_a(Time)
  end
end
