# frozen_string_literal: true

module Api
  module V1
    class RoadTripController < ApplicationController
      def create
        if User.find_by(api_key: params[:api_key])
          render_road_trip
        else
          render json: { message: 'Unauthorized request' }, status: :unauthorized
        end
      end

      private

      def render_road_trip
        unless location_valid?
          return render json: { message: "Please ensure you've entered valid locations" }, status: :not_found
        end

        road_trip = RoadTripFacade.trip(origin: params[:origin], destination: params[:destination])

        if road_trip.nil?
          render json: { message: 'We are unable to route with the given locations.' }, status: :unprocessable_entity
        else
          render json: RoadTripSerializer.new(road_trip)
        end
      end

      def location_valid?
        return false if number?

        geocode_origin = GeocodingFacade.latitude_longitude(params[:origin])
        return false if geocode_origin[:quality_code] == 'A1XAX'

        geocode_destination = GeocodingFacade.latitude_longitude(params[:destination])
        return false if geocode_destination[:quality_code] == 'A1XAX'

        true
      end

      def number?
        params[:origin].scan(/\D/).empty? || params[:destination].scan(/\D/).empty?
      end
    end
  end
end
