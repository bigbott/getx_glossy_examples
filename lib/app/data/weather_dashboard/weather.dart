// weather_model.dart
class Weather {
  final double temperature;
  final String condition;
  final int humidity;
  final double windSpeed;
  final int pressure;
  final DateTime time;

  Weather({
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
    required this.time,
  });

  // Sample data for demo
  static Weather sample() {
    return Weather(
      temperature: 23.5,
      condition: 'Cloudy',
      humidity: 65,
      windSpeed: 5.2,
      pressure: 1015,
      time: DateTime.now(),
    );
  }
}