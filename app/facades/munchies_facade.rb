# frozen_string_literal: true

class MunchiesFacade
  def self.create_munchie(start:, end_location:, food:)
    route_data = MapService.munchies_route(from: start, to: end_location)

    Munchie.new(
      destination: end_location,
      travel_time: travel_time
      forecast: 
      restaurant:
    )
  end

  private

  def seconds_to_hours(seconds)
    hours = seconds / 3600.0
    minutes = (hours % 1) * 60

    "#{hours.floor} hours, #{minutes.round} minutes"
  end
end
