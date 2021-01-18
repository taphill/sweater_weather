# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api/V1/Backgrounds request', type: :request do
  describe 'GET /api/v1/backgrounds?location=', :vcr do
    let(:json_body) { JSON.parse(response.body, symbolize_names: true) }

    before { get api_v1_backgrounds_path, params: { location: 'denver,co' } }

    it 'has data' do
      expect(json_body).to be_a(Hash)
      expect(json_body).to have_key(:data)
      expect(json_body[:data]).to be_a(Hash)
      expect(json_body[:data]).to have_key(:id)
      expect(json_body[:data][:id]).to be_nil
      expect(json_body[:data]).to have_key(:type)
      expect(json_body[:data][:type]).to eq('image')
      expect(json_body[:data]).to have_key(:attributes)
      expect(json_body[:data][:attributes]).to be_a(Hash)
      expect(json_body[:data][:attributes]).to have_key(:image)
      expect(json_body[:data][:attributes][:image]).to be_a(Hash)
    end

    it 'has attributes' do
      expect(json_body[:data][:attributes][:image]).to have_key(:photographer)
      expect(json_body[:data][:attributes][:image][:photographer]).to be_a(String)
      expect(json_body[:data][:attributes][:image]).to have_key(:profile)
      expect(json_body[:data][:attributes][:image][:profile]).to be_a(String)
      expect(json_body[:data][:attributes][:image]).to have_key(:hosting_site)
      expect(json_body[:data][:attributes][:image][:hosting_site]).to be_a(String)
      expect(json_body[:data][:attributes][:image]).to have_key(:image_location)
      expect(json_body[:data][:attributes][:image][:image_location]).to be_a(String)
      expect(json_body[:data][:attributes][:image]).to have_key(:image_url)
      expect(json_body[:data][:attributes][:image][:image_url]).to be_a(String)
    end
  end
end