# frozen_string_literal: true

class GeocodingFacade
  def self.latitude_longitude(location)
    json_body = MapService.geocode(location)

    latitude = json_body[:results].first[:locations].first[:latLng][:lat]
    longitude = json_body[:results].first[:locations].first[:latLng][:lng]
    quality_code = json_body[:results].first[:locations].first[:geocodeQualityCode]

    { latitude: latitude, longitude: longitude, quality_code: quality_code }
  end
end
