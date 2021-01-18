# frozen_string_literal: true

class ImageService
  def self.conn
    Faraday.new(
      url: 'https://api.unsplash.com',
      params: { client_id: Rails.application.credentials.unsplash[:api_key] },
      headers: { 'Content-Type' => 'application/json', 'Accept-Version' => 'v1' }
    )
  end

  def self.background_image_data(location)
    response = conn.get('/search/photos') do |req|
      req.params['query'] = location
      req.params['per_page'] = 1
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  private_class_method :conn
end
