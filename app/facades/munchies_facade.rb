# frozen_string_literal: true

class MunchiesFacade
  def self.create_munchie(start:, end_location:, food:)
    route_data = MapService.munchies_route(from: start, to: end_location)

require 'pry'; binding.pry
    # Munchie.new(
    #   destination: end_location,
    #   travel_time: seconds_to_hours(route_data[:route][:realTime]),
    #   forecast: 
    #   restaurant:
    # )
  end

  def self.seconds_to_hours(seconds)
    hours = seconds / 3600.0
    minutes = (hours % 1) * 60

    "#{hours.floor} hours, #{minutes.round} minutes"
  end

  def self.current_forecast(location)
  end

  def self.restaurant(location:, term:, open_at:)
    data = RestaurantService.find(location: location, term: term, open_at: open_at)

require 'pry'; binding.pry
  end

  private_class_method :seconds_to_hours
end
