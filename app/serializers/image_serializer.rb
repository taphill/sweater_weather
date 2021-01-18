# frozen_string_literal: true

class ImageSerializer
  include FastJsonapi::ObjectSerializer

  set_id { nil }
  set_type :image

  attribute :image, &:instance_values
end
