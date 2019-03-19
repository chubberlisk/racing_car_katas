class Alarm
  LOW_PRESSURE_THRESHOLD = 17
  HIGH_PRESSURE_THRESHOLD = 21

  def initialize(sensor:)
    @sensor = sensor
    @on = false
  end

  def check
    pressure_value = @sensor.pressure_value
    @on = true if low_pressure?(pressure_value) || high_pressure?(pressure_value)
  end

  def on?
    @on
  end

  private

  def low_pressure?(pressure_value)
    pressure_value < LOW_PRESSURE_THRESHOLD
  end

  def high_pressure?(pressure_value)
    HIGH_PRESSURE_THRESHOLD < pressure_value
  end
end
