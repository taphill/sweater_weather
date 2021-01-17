# frozen_string_literal: true

class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  set_id { nil }
  set_type :forecast

  attribute :current_weather do |object|
    object.current_weather.instance_values
  end

  attribute :daily_weather do |object|
    object.daily_weather.each(&:instance_values)
  end

  attribute :hourly_weather do |object|
    object.hourly_weather.each(&:instance_values)
  end
end
