# frozen_string_literal: true

class CurrentWeather
  attr_reader :datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity,
              :uvi, :visibility, :conditions, :icon

  def initialize(attr)
    @datetime = Time.zone.at(attr[:current][:dt]).to_s
    @sunrise = Time.zone.at(attr[:current][:sunrise]).to_s
    @sunset = Time.zone.at(attr[:current][:sunset]).to_s
    @temperature = attr[:current][:temp]
    @feels_like = attr[:current][:feels_like]
    @humidity = attr[:current][:humidity]
    @uvi = attr[:current][:uvi]
    @visibility = attr[:current][:visibility]
    @conditions = attr[:current][:weather].first[:description]
    @icon = attr[:current][:weather].first[:icon]
  end
end
