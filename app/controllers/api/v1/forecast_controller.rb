# frozen_string_literal: true

module Api
  module V1
    class ForecastController < ApplicationController
      def index
        geocode = GeocodingFacade.latitude_longitude(params[:location])
        forecast = WeatherFacade.forecast(latitude: geocode[:latitude], longitude: geocode[:longitude])

        render json: ForecastSerializer.new(forecast)
      end
    end
  end
end
