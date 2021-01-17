class Api::V1::BackgroundsController < ApplicationController
  def index
    conn = Faraday.new(
      url: 'https://api.unsplash.com',
      params: { client_id: Rails.application.credentials.unsplash[:api_key] },
      headers: { 'Content-Type' => 'application/json', 'Accept-Version' => 'v1' }
    )

    response = conn.get('/search/photos') do |req|
      req.params['query'] = "#{params[:location]} city skyline"
      req.params['per_page'] = 1
    end

    json_body = JSON.parse(response.body, symbolize_names: true)
require 'pry'; binding.pry
  end
end
