class WeatherFacade
  def self.weather_data(latitude:, longitude:)
    data = WeatherService.weather_data(latitude, longitude) 
  end
end
