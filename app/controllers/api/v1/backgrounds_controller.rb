# frozen_string_literal: true

module Api
  module V1
    class BackgroundsController < ApplicationController
      def index
        geocode = GeocodingFacade.latitude_longitude(params[:location])

        if location_valid?(geocode[:quality_code])
          image = ImageFacade.background_image(params[:location])
          render json: ImageSerializer.new(image)
        else
          render json: { message: 'Please ensure you entered a valid location' }, status: :not_found
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
