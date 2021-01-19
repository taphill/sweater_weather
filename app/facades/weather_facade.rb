# frozen_string_literal: true

class WeatherFacade
  def self.forecast(latitude:, longitude:)
    data = WeatherService.weather_data(latitude: latitude, longitude: longitude)

    Forecast.new(
      current_weather: CurrentWeather.new(data),
      daily_weather: daily_weather(data),
      hourly_weather: hourly_weather(data)
    )
  end

  def self.max_hourly(latitude:, longitude:)
    data = WeatherService.weather_data(latitude: latitude, longitude: longitude)

    data[:hourly].map do |hour|
      HourlyWeather.new(hour)
    end
  end

  def self.daily_weather(data)
    data[:daily][0..4].map do |day|
      DailyWeather.new(day)
    end
  end

  def self.hourly_weather(data)
    data[:hourly][0..7].map do |hour|
      HourlyWeather.new(hour)
    end
  end

  private_class_method :daily_weather, :hourly_weather
end
