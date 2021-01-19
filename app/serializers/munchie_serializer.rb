# frozen_string_literal: true

class MunchieSerializer
  include FastJsonapi::ObjectSerializer

  set_id { nil }
  set_type :munchie

  attributes :destination_city, :travel_time

  attribute :forecast do |object|
    object.forecast
  end

  attribute :restaurant do |object|
    object.restaurant
  end
end
