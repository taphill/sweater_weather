# frozen_string_literal: true

class MapService
  def self.conn
    Faraday.new(
      url: 'http://www.mapquestapi.com/geocoding/v1/',
      params: { key: Rails.application.credentials.mapquest[:api_key] },
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  def self.location(location)
    response = conn.get('address') do |request|
      request.params['location'] = location
      request.params['maxResults'] = 1
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.route(origin:, destination:)
  end

  private_class_method :conn
end
