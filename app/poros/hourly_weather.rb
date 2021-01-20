# frozen_string_literal: true

class HourlyWeather
  attr_reader :time, :temperature, :wind_speed, :wind_direction, :conditions, :icon

  def initialize(attr)
    @time = Time.zone.at(attr[:dt]).getlocal.strftime('%l:%M%p').delete(' ')
    @temperature = attr[:temp]
    @wind_speed = "#{attr[:wind_speed].round} mph"
    @wind_direction = calculate_wind_direction(attr[:wind_deg])
    @conditions = attr[:weather].first[:description]
    @icon = attr[:weather].first[:icon]
  end

  private

  def calculate_wind_direction(wind_deg)
    return 'from N' if northerly(wind_deg)
    return 'from NW' if north_westerly(wind_deg)
    return 'from W' if westerly(wind_deg)
    return 'from SW' if south_westerly(wind_deg)
    return 'from S' if southerly(wind_deg)
    return 'from SE' if south_easterly(wind_deg)
    return 'from E' if easterly(wind_deg)
    return 'from NE' if north_easterly(wind_deg)
  end

  def northerly(wind_deg)
    wind_deg > 337.5 || wind_deg < 22.5
  end

  def north_westerly(wind_deg)
    wind_deg > 292.5
  end

  def westerly(wind_deg)
    wind_deg > 247.5
  end

  def south_westerly(wind_deg)
    wind_deg > 202.5
  end

  def southerly(wind_deg)
    wind_deg > 157.5
  end

  def south_easterly(wind_deg)
    wind_deg > 122.5
  end

  def easterly(wind_deg)
    wind_deg > 67.5
  end

  def north_easterly(wind_deg)
    wind_deg > 22.5
  end
end
