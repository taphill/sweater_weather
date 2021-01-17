# frozen_string_literal: true

class ImageFacade
  def self.background_image(location)
    data = ImageService.background_image_data(location)

    Image.new(attr: data, location: location)
  end
end
