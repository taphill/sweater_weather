# frozen_string_literal: true

module Api
  module V1
    class MunchiesController < ApplicationController
      def index
        munchie = MunchiesFacade.create_munchie(
          start: params[:start],
          end_location: params[:end_location],
          food: params[:food]
        )

        render json: MunchieSerializer.new(munchie)
      end
    end
  end
end
