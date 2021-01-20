# frozen_string_literal: true

class RoadTripFacade
  def self.trip(origin:, destination:)
    data = MapService.route(origin: origin, destination: destination)

    travel_time = seconds_to_hours(data)

    RoadTrip.new(
      start_city: origin,
      end_city: destination,
      travel_time: travel_time,
      weather_at_eta: weather_at_eta(end_city: destination, travel_time: travel_time)
    )
  end

  def self.seconds_to_hours(data)
    return 'impossible route' unless data[:info][:messages].empty?

    hours = data[:time].last / 3600.0
    minutes = (hours % 1) * 60

    "#{hours.floor} hour(s), #{minutes.round} minutes"
  end

  def self.weather_at_eta(end_city:, travel_time:)
    return nil if travel_time == 'impossible route'

    geocode = GeocodingFacade.latitude_longitude(end_city)
    hourly = WeatherFacade.max_hourly(latitude: geocode[:latitude], longitude: geocode[:longitude])

    return nil if travel_time.split.first.to_i > 48

    weather = hourly[travel_time.split.first.to_i - 1]

    {
      temperature: weather.temperature,
      conditions: weather.conditions
    }
  end

  private_class_method :seconds_to_hours, :weather_at_eta
end
