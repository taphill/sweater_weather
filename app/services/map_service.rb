# frozen_string_literal: true

class MapService
  def self.conn
    Faraday.new(
      url: 'http://www.mapquestapi.com',
      params: { key: Rails.application.credentials.mapquest[:api_key] },
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  def self.geocode(location)
    response = conn.get('geocoding/v1/address') do |request|
      request.params['location'] = location
      request.params['maxResults'] = 1
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.route(origin:, destination:)
    response = conn.post('directions/v2/routematrix') do |request|
      request.body = { locations: [origin, destination] }.to_json
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  private_class_method :conn
end
