class GeocodingFacade
  def self.latitude_longitude(location)
    json_body = GeocodingService.location(location)

    latitude = json_body[:results].first[:locations].first[:latLng][:lat]
    longitude = json_body[:results].first[:locations].first[:latLng][:lng]

    { latitude: latitude, longitude: longitude }
  end
end
