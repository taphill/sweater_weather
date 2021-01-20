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
          render json: { message: 'Please ensure you entered a valid location' }, status: :not_found
        end
      end

      private

      def location_valid?(code)
        return false if number?
        return false if code == 'A1XAX'

        true
      end

      def number?
        params[:location].scan(/\D/).empty?
      end
    end
  end
end
