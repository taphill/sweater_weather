class WeatherFacade
  def self.weather_data(latitude:, longitude:)
    data = WeatherService.weather_data(latitude: latitude, longitude: longitude) 

    Forecast.new(
      current_weather: CurrentWeather.new(data),
      daily_weather: daily_weather(data),
      hourly_weather: hourly_weather(data)
    )
  end

  def self.daily_weather(data)
    data[:daily][0..4].map do |day|
      DailyWeather.new(day) 
    end
  end

  def self.hourly_weather(data)
    x = data[:hourly].map do |hour|
      HourlyWeather.new(hour)
    end

require 'pry'; binding.pry
  end
end
