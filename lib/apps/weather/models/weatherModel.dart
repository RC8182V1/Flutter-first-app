import 'package:flutter/material.dart';

class WeatherModel {
  final IconData icon;
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
      icon: Icons.error,
      temperature: 0.0,
      dayState: 'N/A',
      weatherStatus: 'N/A',
    );
  }
}
