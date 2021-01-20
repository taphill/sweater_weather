# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Image, type: :poro do
  describe 'attributes', :vcr do
    let(:data) { ImageService.background_image_data('denver,co') }
    let(:image) { Image.new(attr: data, location: 'denver,co') }

    it { expect(image).to be_a(Image) }

    it { expect(image.photographer).to be_a(String) }
    it { expect(image.profile).to be_a(String) }
    it { expect(image.hosting_site).to be_a(String) }
    it { expect(image.image_location).to be_a(String) }
    it { expect(image.image_url).to be_a(String) }
  end
end
