import 'package:firstapp/apps/weather/models/weatherModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherProvider extends ChangeNotifier {
  late WeatherModel _currentWeather = WeatherModel.empty();
  String url =
      'https://api.open-meteo.com/v1/forecast?latitude=28.05&longitude=-16.54&hourly=temperature_2m,weathercode,windspeed_10m,windgusts_10m,winddirection_10m,uv_index&models=gfs_global&current_weather=true&windspeed_unit=kn&timezone=Europe%2FLondon';

  WeatherModel get currentWeather => _currentWeather;

  Future<void> fetchWeatherData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      String isDay = data['current_weather']['is_day'] == 1 ? 'Day' : 'Night';
      int weatherCode = data['current_weather']['weathercode'];
      double temperature = data['current_weather']['temperature'];
      String weatherStatus;
      Image icon;

      switch (weatherCode) {
        case 0:
          weatherStatus = 'Clear';
          icon =
              Image.asset('lib/Icons/dia/soleado.png', width: 40, height: 40);
          break;
        case 1:
          weatherStatus = 'Cloudy';
          //icon = Icons.cloud;
          break;
        case 2:
          weatherStatus = 'Light rain';
          // icon = Icons.shower;
          break;
        case 3:
          weatherStatus = 'Rain';
          // icon = Icons.shower;
          break;
        default:
          weatherStatus = 'Clear';
        //  icon = Icons.sunny;
      }

      WeatherModel weather = WeatherModel(
        icon: icon,
        temperature: temperature,
        dayState: isDay,
        weatherStatus: weatherStatus,
      );

      _currentWeather = weather;
      notifyListeners();
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
