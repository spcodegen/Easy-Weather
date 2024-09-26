import 'package:easy_weather/models/weather_model.dart';
import 'package:easy_weather/services/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherService _weatherService =
      WeatherService(apiKey: dotenv.env["OPEN_WEATHER_API_KEY"] ?? "");

  Weather? _weather;

//method to fetch the weather
  void fetchWeather() async {
    try {
      final weather = await _weatherService.getWeatherFromLocation();

      setState(() {
        _weather = weather;
      });
    } catch (error) {
      print("Error from weather data:$error");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: const Center(
        child: Text("Hello World!"),
      ),
    );
  }
}
