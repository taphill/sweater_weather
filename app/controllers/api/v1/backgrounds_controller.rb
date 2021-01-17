# frozen_string_literal: true

module Api
  module V1
    class BackgroundsController < ApplicationController
      def index
        image = ImageFacade.background_image(params[:location])

        render json: ImageSerializer.new(image)
      end
    end
  end
end
