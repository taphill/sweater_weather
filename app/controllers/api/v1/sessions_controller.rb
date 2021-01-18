# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.find_by(email: session_params[:email].downcase)

        if user&.authenticate(session_params[:password])
          render json: UserSerializer.new(user)
        else
          render json: { message: 'Incorrect username or password' }, status: :forbidden
        end
      end

      private

      def session_params
        params.permit(:email, :password)
      end
    end
  end
end
