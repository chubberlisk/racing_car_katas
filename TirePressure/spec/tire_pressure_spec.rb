require_relative '../tire_pressure'

describe Alarm do
  class SensorStub
    attr_reader :pressure_value

    def initialize(pressure_value:)
      @pressure_value = pressure_value
    end
  end

  it 'can set the alarm to off as default' do
    alarm = Alarm.new(sensor: SensorStub.new(pressure_value: 19))

    expect(alarm.on?).to eq(false)
  end

  it 'can turn the alarm on if pressure is too low' do
    alarm = Alarm.new(sensor: SensorStub.new(pressure_value: 16.99))

    alarm.check

    expect(alarm.on?).to eq(true)
  end

  it 'can turn the alarm on if pressure is too low' do
    alarm = Alarm.new(sensor: SensorStub.new(pressure_value: 21.01))

    alarm.check

    expect(alarm.on?).to eq(true)
  end

  it 'cannot turn the alarm on if pressure is within threshold' do
    alarm = Alarm.new(sensor: SensorStub.new(pressure_value: 19))

    alarm.check

    expect(alarm.on?).to eq(false)
  end
end
