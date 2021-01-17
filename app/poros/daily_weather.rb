class DailyWeather
  attr_reader :date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon

  def initialize(attr)
    @date = Time.at(attr[:dt]).to_date.to_s
    @sunrise = Time.at(attr[:sunrise])
    @sunset = Time.at(attr[:sunset])
    @max_temp = attr[:temp][:max]
    @min_temp = attr[:temp][:min]
    @conditions = attr[:weather].first[:description]
    @icon = attr[:weather].first[:icon]
  end
end
