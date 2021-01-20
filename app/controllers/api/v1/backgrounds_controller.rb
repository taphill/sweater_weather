# frozen_string_literal: true

module Api
  module V1
    class BackgroundsController < ApplicationController
      def index
        if location_valid?
          image = ImageFacade.background_image(params[:location])
          render json: ImageSerializer.new(image)
        else
          render json: { message: 'Please ensure you entered a valid location' }, status: :not_found
        end
      end

      private

      def location_valid?
        return false if number?

        geocode = GeocodingFacade.latitude_longitude(params[:location])
        return false if geocode[:quality_code] == 'A1XAX'

        true
      end

      def number?
        params[:location].to_i.to_s == params[:location]
      end
    end
  end
end
