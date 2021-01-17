class CurrentWeather
  attr_reader :datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity,
              :uvi, :visibility, :conditions, :icon

  def initialize(attr)
    @datetime = Time.at(attr[:current][:dt])
    @sunrise = Time.at(attr[:current][:sunrise])
    @sunset = Time.at(attr[:current][:sunset])
    @temperature = attr[:current][:temp]
    @feels_like = attr[:current][:feels_like]
    @humidity = attr[:current][:humidity]
    @uvi = attr[:current][:uvi]
    @visibility = attr[:current][:visibility]
    @conditions = attr[:current][:weather].first[:description]
    @icon = attr[:current][:weather].first[:icon]
  end
end
