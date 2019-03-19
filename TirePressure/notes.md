# TirePressureMonitoringSystem Exercise

SOLID Violations:

- Dependency Inversion Principle - There was a dependency on `Sensor` as it called `Sensor.new`. This has been solved by taking in a `sensor` as an argument to its constructor.
