# frozen_string_literal: true

class RoadTripFacade
  def self.trip(origin:, destination:)
    data = MapService.route(origin: origin, destination: destination)

    travel_time = seconds_to_hours(data[:time].last)
    
    RoadTrip.new(
      start_city: origin,
      end_city: destination,
      travel_time: travel_time
      weather_at_eta: weather_at_eta(end_city: destination, travel_time: travel_time)
    )
  end

  private

  def seconds_to_hours(seconds)
    hours = seconds / 3600.0
    minutes = (hours % 1) * 60

    "#{hours.floor} hours, #{minutes.round} minutes"
  end
  
  def weather_at_eta(end_city:, travel_time:)

  end
end
