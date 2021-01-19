# frozen_string_literal: true

class RestaurantService
 def self.conn
    Faraday.new(
      url: 'https://api.yelp.com',
      params: { key: Rails.application.credentials.mapquest[:api_key] },
      headers: { 'Authorization' => "Bearer #{Rails.application.credentials.yelp[:api_key]}" }
    )
  end

  def self.find(location:, term:, open_at:)
    response = conn.get('v3/businesses/search') do |request|
      request.params['location'] = location
      request.params['term'] = term
      request.params['open_at'] = open_at
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  private_class_method :conn
end
