# frozen_string_literal: true

class Image
  attr_reader :photographer, :profile, :image_location, :image_url

  def initialize(attr:, location:)
    @photographer = attr[:results].first[:user][:name]
    @profile = attr[:results].first[:user][:links][:html]
    @hosting_site = 'https://www.unsplash.com'
    @image_location = location
    @image_url = attr[:results].first[:urls][:raw]
  end
end
