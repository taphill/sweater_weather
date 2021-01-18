# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api/V1/Users request', type: :request do
  describe 'POST /api/v1/users' do
    let(:json_body) { JSON.parse(response.body, symbolize_names: true) }

    context 'when valid' do
      before { 
        post api_v1_users_path,
        params: { email: 'hi@example.com', password: 'password', password_confirmation: 'password' }
      }

      it { expect(response.status).to eq(201) }

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

    context 'when missing email' do
      before { 
        post api_v1_users_path,
        params: { password: 'password', password_confirmation: 'password' }
      }

      it { expect(response.status).to eq(403) }
      it { expect(json_body).to have_key(:message) }
      it { expect(json_body[:message]).to eq("Validation failed: Email can't be blank") }
    end

    context 'when missing password' do
      before { 
        post api_v1_users_path,
        params: { email: 'hi@example.com', password_confirmation: 'password' }
      }

      it { expect(response.status).to eq(403) }
      it { expect(json_body).to have_key(:message) }
      it { expect(json_body[:message]).to eq("Validation failed: Password can't be blank") }
    end

    context 'when missing password confirmation' do
      before { 
        post api_v1_users_path,
        params: { email: 'hi@example.com', password: 'password' }
      }

      it { expect(response.status).to eq(403) }
      it { expect(json_body).to have_key(:message) }
      it { expect(json_body[:message]).to eq("Validation failed: Password confirmation can't be blank") }
    end

    context 'when password does not match password confirmation' do
      before { 
        post api_v1_users_path,
        params: { email: 'hi@example.com', password: 'password', password_confirmation: 'pass' }
      }

      it { expect(response.status).to eq(403) }
      it { expect(json_body).to have_key(:message) }
      it { expect(json_body[:message]).to eq("Validation failed: Password confirmation doesn't match Password") }
    end

    context 'when user email already exists' do
      let!(:user) { create(:user, email: 'hi@example.com') }

      before { 
        post api_v1_users_path,
        params: { email: 'hi@example.com', password: 'password', password_confirmation: 'password' }
      }

      it { expect(response.status).to eq(403) }
      it { expect(json_body).to have_key(:message) }
      it { expect(json_body[:message]).to eq("Validation failed: Email has already been taken") }
    end
  end
end
