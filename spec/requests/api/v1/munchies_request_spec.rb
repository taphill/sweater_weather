# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api/V1/Munchies request', type: :request do
  describe 'GET /api/v1/munchies' do
    let(:json_body) { JSON.parse(response.body, symbolize_names: true) }

    before do
      get api_v1_munchies_path,
          params: { start: 'denver,co', end: 'pueblo,co', food: 'mexican' }
    end

    it { expect(response.status).to eq(200) }

    # it { expect(json_body).to be_a(Hash) }
    # it { expect(json_body).to have_key(:data) }
    # it { expect(json_body[:data]).to be_a(Hash) }
    # it { expect(json_body[:data]).to have_key(:id) }
    # it { expect(json_body[:data][:id]).to be_nil }
    # it { expect(json_body[:data]).to have_key(:type) }
    # it { expect(json_body[:data][:type]).to eq('forecast') }
  end
end
