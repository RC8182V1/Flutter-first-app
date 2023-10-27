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
    return WeatherModel(
      icon: Image.asset('lib/Icons/dia/soleado.png', width: 40, height: 40),
      temperature: 0.0,
      dayState: 'N/A',
      weatherStatus: 'N/A',
    );
  }
}
