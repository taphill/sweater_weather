# frozen_string_literal: true

module Api
  module V1
    class ForecastController < ApplicationController
      def index
        geocode = GeocodingFacade.latitude_longitude(params[:location])

        if location_valid?(geocode[:quality_code])
          forecast = WeatherFacade.forecast(latitude: geocode[:latitude], longitude: geocode[:longitude])
          render json: ForecastSerializer.new(forecast)
        else
          render json: { message: 'Please ensure you entered a valid location' }, status: 404
        end
      end

      private

      def location_valid?(code)
        return false if code == 'A1XAX'

        true
      end
    end
  end
end
