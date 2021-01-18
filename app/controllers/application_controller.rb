# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  private

  def record_invalid(error)
    render json: { message: error.message }, status: :forbidden
  end
end
