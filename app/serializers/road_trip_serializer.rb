# frozen_string_literal: true

class RoadTripSerializer
  include FastJsonapi::ObjectSerializer

  set_id { nil }
  set_type :roadtrip

  attributes :start_city, :end_city, :travel_time

  attribute :weather_at_eta, &:weather_at_eta
end
