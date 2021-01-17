# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api/V1/Forecast request', type: :request do
  describe 'GET /api/v1/forecast?location=', :vcr do
    let(:json_body) { JSON.parse(response.body, symbolize_names: true) }

    before { get api_v1_forecast_index_path, params: { location: 'denver,co' } }

    it { expect(response.status).to eq(200) }
  end
end
