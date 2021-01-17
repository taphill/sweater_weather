# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api/V1/Backgrounds request', type: :request do
  describe 'GET /api/v1/backgrounds?location=', :vcr do
    let(:json_body) { JSON.parse(response.body, symbolize_names: true) }

    before { get api_v1_backgrounds_path, params: { location: 'denver,co' } }

    it 'has data' do
    end
  end
end
