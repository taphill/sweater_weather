# frozen_string_literal: true

module Api
  module V1
    class RoadTripController < ApplicationController
      def create
        if User.find_by(api_key: params[:api_key])
          road_trip = RoadTripFacade.trip(origin: params[:origin], destination: params[:destination])

          render json: RoadTripSerializer.new(road_trip)
        else
          render json: { message: 'Unauthorized request' }, status: :unauthorized
        end
      end
    end
  end
end
