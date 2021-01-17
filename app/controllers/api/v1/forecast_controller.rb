# frozen_string_literal: true

module Api
  module V1
    class ForecastController < ApplicationController
      def index
        # geocoding = GeocodingFacade.latitude_longitude(params[:location])
        # weather = WeatherFacade(latitude: geocoding[latitude], longitude: geocoding[:longitude])

        forecast = WeatherFacade.weather_data(latitude: 39.738453, longitude: -104.984853)

        render json: ForecastSerializer.new(forecast)
      end
    end
  end
end
