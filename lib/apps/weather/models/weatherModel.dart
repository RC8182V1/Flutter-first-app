import 'package:flutter/material.dart';

class WeatherModel {
  final Image icon;
  final double temperature;
  final String dayState;
  final String weatherStatus;

  WeatherModel({
    required this.icon,
    required this.temperature,
    required this.dayState,
    required this.weatherStatus,
  });

  static WeatherModel empty() {
    Image isDay =
        Image.asset('lib/Icons/day/clear-day.png', width: 40, height: 40);
    return WeatherModel(
      icon: isDay,
      temperature: 0.0,
      dayState: 'N/A',
      weatherStatus: 'N/A',
    );
  }
}
