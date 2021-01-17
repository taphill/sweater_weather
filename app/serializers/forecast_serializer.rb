class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  set_id { nil }
  set_type :forecast

  attribute :current_weather do |object|
    object.current_weather.instance_values
  end
end
