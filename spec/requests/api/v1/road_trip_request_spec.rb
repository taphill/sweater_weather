# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api/V1/Road trip request', type: :request do
  describe 'POST /api/v1/road_trip' do
    let(:json_body) { JSON.parse(response.body, symbolize_names: true) }
  end
end
