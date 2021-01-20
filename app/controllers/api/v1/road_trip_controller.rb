# frozen_string_literal: true

module Api
  module V1
    class RoadTripController < ApplicationController
      def create
        unless location_valid?
          return render json: { message: "Please ensure you've entered valid locations" }, status: :not_found
        end

        if User.find_by(api_key: params[:api_key])
          road_trip = RoadTripFacade.trip(origin: params[:origin], destination: params[:destination])

          render json: RoadTripSerializer.new(road_trip)
        else
          render json: { message: 'Unauthorized request' }, status: :unauthorized
        end
      end

      private

      def location_valid?
        return false if is_number?

        geocode_origin = GeocodingFacade.latitude_longitude(params[:origin])
        return false if geocode_origin[:quality_code] == 'A1XAX'

        geocode_destination = GeocodingFacade.latitude_longitude(params[:destination])
        return false if geocode_destination[:quality_code] == 'A1XAX'

        true
      end

      def is_number?
        params[:origin].to_i.to_s == params[:origin] || params[:destination].to_i.to_s == params[:destination]
      end
    end
  end
end
