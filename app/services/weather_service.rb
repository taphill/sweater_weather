# frozen_string_literal: true

class WeatherService
  def self.conn
    Faraday.new(
      url: 'https://api.openweathermap.org/data/2.5/',
      params: { appid: Rails.application.credentials.openweathermap[:api_key] },
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  def self.weather_data(latitude:, longitude:)
    response = conn.get('onecall') do |req|
      req.params['lat'] = latitude
      req.params['lon'] = longitude
      req.params['units'] = 'imperial'
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  private_class_method :conn
end
