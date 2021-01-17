# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImageFacade, type: :facade do
  describe 'class methods' do
    describe '.background_image(location)', :vcr do
      it 'returns photo object' do
        image = ImageFacade.background_image('denver,co')

        expect(image).to be_a(Image)
        expect(image.photographer).to be_a(String)
        expect(image.profile).to be_a(String)
        expect(image.image_location).to be_a(String)
        expect(image.image_url).to be_a(String)
      end
    end
  end
end
