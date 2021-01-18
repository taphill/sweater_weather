# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api/V1/Sessions request', type: :request do
  describe 'POST /api/v1/sessions' do
    let!(:user) { create(:user, email: 'hi@example.com', password: 'password', password_confirmation: 'password') }

    let(:json_body) { JSON.parse(response.body, symbolize_names: true) }

    context 'when valid' do
      before do
        post api_v1_sessions_path,
             params: { email: 'hi@example.com', password: 'password' }
      end

      it { expect(response.status).to eq(200) }

      it { expect(json_body).to be_a(Hash) }
      it { expect(json_body).to have_key(:data) }
      it { expect(json_body[:data]).to be_a(Hash) }
      it { expect(json_body[:data]).to have_key(:id) }
      it { expect(json_body[:data][:id]).to eq(User.all.first.id.to_s) }
      it { expect(json_body[:data]).to have_key(:type) }
      it { expect(json_body[:data][:type]).to eq('user') }
      it { expect(json_body[:data]).to have_key(:attributes) }
      it { expect(json_body[:data][:attributes]).to be_a(Hash) }

      it { expect(json_body[:data][:attributes]).to have_key(:email) }
      it { expect(json_body[:data][:attributes][:email]).to eq(User.all.first.email) }
      it { expect(json_body[:data][:attributes]).to have_key(:api_key) }
      it { expect(json_body[:data][:attributes][:api_key]).to eq(User.all.first.api_key) }
    end

    context 'when email does not exist' do
      before do
        post api_v1_sessions_path,
             params: { email: 'mikejones@example.com', password: 'password' }
      end

      it { expect(response.status).to eq(403) }
      it { expect(json_body).to have_key(:message) }
      it { expect(json_body[:message]).to eq('Incorrect username or password') }
    end

    context 'when password does not match' do
      before do
        post api_v1_sessions_path,
             params: { email: 'hi@example.com', password: 'pass' }
      end

      it { expect(response.status).to eq(403) }
      it { expect(json_body).to have_key(:message) }
      it { expect(json_body[:message]).to eq('Incorrect username or password') }
    end
  end
end
