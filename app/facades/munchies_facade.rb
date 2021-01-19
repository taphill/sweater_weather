# frozen_string_literal: true

class MunchiesFacade
  def self.create_munchie(start:, end_location:, food:)
    route_data = MapService.munchies_route(from: start, to: end_location)
    
    Munchie.new(
      destination: end_location,
      travel_time: seconds_to_hours(route_data[:route][:realTime]),
      forecast: current_forecast(end_location),
      restaurant: restaurant(location: end_location, term: food, open_at: (Time.now.getlocal + route_data[:route][:realTime]).to_i)
    )
  end

  def self.seconds_to_hours(seconds)
    hours = seconds / 3600.0
    minutes = (hours % 1) * 60

    "#{hours.floor} hour(s), #{minutes.round} minutes"
  end

  def self.current_forecast(location)
    geocode = GeocodingFacade.latitude_longitude(location)
    forecast = WeatherFacade.forecast(latitude: geocode[:latitude], longitude: geocode[:longitude])

    {
      summary: forecast.current_weather.conditions,
      temperature: forecast.current_weather.temperature.to_s
    }
  end

  def self.restaurant(location:, term:, open_at:)
    data = RestaurantService.find(location: location, term: term, open_at: open_at)

    {
      name: data[:businesses].first[:name],
      address: data[:businesses].first[:location][:display_address].join
    }
  end

  private_class_method :seconds_to_hours, :current_forecast, :restaurant
end
