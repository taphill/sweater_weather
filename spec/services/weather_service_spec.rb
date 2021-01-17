# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeatherService, type: :service do
  describe 'class methods' do
    describe '.weather_data(latitude, longitude)', :vcr do
      let(:json) { WeatherService.weather_data(latitude: 39.738453, longitude: -104.984853) }

      it { expect(json).to be_a(Hash) }

      # current weather
      it { expect(json).to have_key(:current) }
      it { expect(json[:current]).to be_a(Hash) }

      it { expect(json[:current]).to have_key(:dt) }
      it { expect(json[:current][:dt]).to be_a(Integer) }

      it { expect(json[:current]).to have_key(:sunrise) }
      it { expect(json[:current][:sunrise]).to be_a(Integer) }

      it { expect(json[:current]).to have_key(:sunset) }
      it { expect(json[:current][:sunset]).to be_a(Integer) }

      it { expect(json[:current]).to have_key(:temp) }
      it { expect(json[:current][:temp]).to be_a(Float) }

      it { expect(json[:current]).to have_key(:feels_like) }
      it { expect(json[:current][:feels_like]).to be_a(Float) }

      it { expect(json[:current]).to have_key(:humidity) }
      it { expect(json[:current][:humidity]).to be_a(Integer) }

      it { expect(json[:current]).to have_key(:uvi) }
      it { expect(json[:current][:uvi]).to be_a(Float) }

      it { expect(json[:current]).to have_key(:visibility) }
      it { expect(json[:current][:visibility]).to be_a(Integer) }

      it { expect(json[:current]).to have_key(:weather) }
      it { expect(json[:current][:weather]).to be_a(Array) }

      it { expect(json[:current][:weather].first).to have_key(:description) }
      it { expect(json[:current][:weather].first[:description]).to be_a(String) }

      it { expect(json[:current][:weather].first).to have_key(:icon) }
      it { expect(json[:current][:weather].first[:icon]).to be_a(String) }

      # daily weather
      it { expect(json).to have_key(:daily) }
      it { expect(json[:daily]).to be_a(Array) }
      it { expect(json[:daily].first).to be_a(Hash) }

      it { expect(json[:daily].first).to have_key(:dt) }
      it { expect(json[:daily].first[:dt]).to be_a(Integer) }

      it { expect(json[:daily].first).to have_key(:sunrise) }
      it { expect(json[:daily].first[:sunrise]).to be_a(Integer) }

      it { expect(json[:daily].first).to have_key(:sunset) }
      it { expect(json[:daily].first[:sunset]).to be_a(Integer) }

      it { expect(json[:daily].first).to have_key(:temp) }
      it { expect(json[:daily].first[:temp]).to be_a(Hash) }

      it { expect(json[:daily].first[:temp]).to have_key(:max) }
      it { expect(json[:daily].first[:temp][:max]).to be_a(Float) }

      it { expect(json[:daily].first[:temp]).to have_key(:min) }
      it { expect(json[:daily].first[:temp][:min]).to be_a(Float) }

      it { expect(json[:daily].first).to have_key(:weather) }
      it { expect(json[:daily].first[:weather]).to be_a(Array) }
      it { expect(json[:daily].first[:weather].first).to be_a(Hash) }

      it { expect(json[:daily].first[:weather].first).to have_key(:description) }
      it { expect(json[:daily].first[:weather].first[:description]).to be_a(String) }

      it { expect(json[:daily].first[:weather].first).to have_key(:icon) }
      it { expect(json[:daily].first[:weather].first[:icon]).to be_a(String) }

      # hourly weather
      it { expect(json).to have_key(:hourly) }
      it { expect(json[:hourly]).to be_a(Array) }
      it { expect(json[:hourly].first).to be_a(Hash) }

      it { expect(json[:hourly].first).to have_key(:dt) }
      it { expect(json[:hourly].first[:dt]).to be_a(Integer) }

      it { expect(json[:hourly].first).to have_key(:temp) }
      it { expect(json[:hourly].first[:temp]).to be_a(Float) }

      it { expect(json[:hourly].first).to have_key(:wind_speed) }
      it { expect(json[:hourly].first[:wind_speed]).to be_a(Float) }

      it { expect(json[:hourly].first).to have_key(:wind_deg) }
      it { expect(json[:hourly].first[:wind_deg]).to be_a(Integer) }

      it { expect(json[:hourly].first).to have_key(:weather) }
      it { expect(json[:hourly].first[:weather]).to be_a(Array) }
      it { expect(json[:hourly].first[:weather].first).to be_a(Hash) }

      it { expect(json[:hourly].first[:weather].first).to have_key(:description) }
      it { expect(json[:hourly].first[:weather].first[:description]).to be_a(String) }

      it { expect(json[:hourly].first[:weather].first).to have_key(:icon) }
      it { expect(json[:hourly].first[:weather].first[:icon]).to be_a(String) }
    end
  end
end
