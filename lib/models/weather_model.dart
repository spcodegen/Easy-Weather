class Weather {
  final String cityName;
  final double temperature;
  final String condition;
  final String description;
  final double pressure;
  final double humidity;
  final double windSpeed;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.description,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
  });

  //Method to convert the json data to weather object
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json["name"],
      temperature: json["main"]["temp"].toDouble(),
      condition: json["weather"][0]["main"],
      description: json["weather"][0]["description"],
      pressure: json["main"]["pressure"].toDouble(),
      humidity: json["main"]["humidity"].toDouble(),
      windSpeed: json["wind"]["speed"].toDouble(),
    );
  }
}
