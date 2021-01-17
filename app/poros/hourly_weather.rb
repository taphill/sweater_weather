class HourlyWeather
  attr_reader :date, :temperature, :wind_speed, :wind_direction, :conditions, :icon

  def initialize(attr)
    @time = Time.at(attr[:dt]).to_date.to_s
    @temperature = attr[:temp] 
    @wind_speed = "#{attr[:wind_speed].round} mph" 
    @wind_deg = attr[:wind_deg]
    @conditions = attr[:weather].first[:description]
    @icon = attr[:weather].first[:icon]
  end

  def wind_direction
    return "from N" if northerly?
    return "from NW" if north_westerly?
    return "from W" if westerly?
    return "from SW" if south_westerly?
    return "from S" if southerly?
    return "from SE" if south_easterly?
    return "from E" if easterly?
    return "from NE" if north_easterly?
  end

  private
  
  attr_reader :wind_deg

  def northerly?
    wind_deg > 337.5 || wind_deg < 22.5
  end

  def north_westerly?
    wind_deg > 292.5
  end

  def westerly?
    wind_deg > 247.5
  end

  def south_westerly?
    wind_deg > 202.5
  end

  def southerly?
    wind_deg > 157.5
  end

  def south_easterly?
    wind_deg > 122.5
  end

  def easterly?
    wind_deg > 67.5
  end

  def north_easterly?
    wind_deg > 22.5
  end
end
