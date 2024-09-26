import 'dart:convert';

import 'package:easy_weather/models/weather_model.dart';
import 'package:easy_weather/services/get_location_service.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  //https://api.openweathermap.org/data/2.5/weather?q=Kandy&appid=8bf9d63ac64c8377dbec653683883acc&units=metric

  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  WeatherService({required this.apiKey});

  //get the weather from the city name
  Future<Weather> getWeather(String cityName) async {
    try {
      final url = '$BASE_URL?q=$cityName&appid=$apiKey&units=metric';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Weather.fromJson(json);
      } else {
        throw Exception("Faild to load the weather data");
      }
    } catch (error) {
      throw Exception("Faild to load the weather data");
    }
  }

  //get the weather form the current location
  Future<Weather> getWeatherFromLocation() async {
    try {
      final location = GetLocationService();
      final cityName = await location.getCityNameFormCurrentLocation();

      final url = '$BASE_URL?q=$cityName&appid=$apiKey&units=metric';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Weather.fromJson(json);
      } else {
        throw Exception("Faild to load the weather data");
      }
    } catch (e) {
      print(e.toString());
      throw Exception("Faild to load the weather data");
    }
  }
}
