# frozen_string_literal: true

class DailyWeather
  attr_reader :date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon

  def initialize(attr)
    @date = Time.zone.at(attr[:dt]).getlocal.to_date.to_s
    @sunrise = Time.zone.at(attr[:sunrise]).getlocal.to_s
    @sunset = Time.zone.at(attr[:sunset]).getlocal.to_s
    @max_temp = attr[:temp][:max]
    @min_temp = attr[:temp][:min]
    @conditions = attr[:weather].first[:description]
    @icon = attr[:weather].first[:icon]
  end
end
