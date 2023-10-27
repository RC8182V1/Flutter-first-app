import 'package:flutter/material.dart';

class WeatherDisplay extends StatelessWidget {
  const WeatherDisplay({
    Key? key,
    required this.icon,
    required this.temperature,
    required this.dayState,
    required this.weatherStatus,
  }) : super(key: key);

  final IconData icon;
  final double temperature;
  final String dayState;
  final String weatherStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(dayState, style: TextStyle(color: Colors.white)),
              Text('Temperature: $temperatureºC',
                  style: TextStyle(color: Colors.white)),
              Text('The sky is $weatherStatus',
                  style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
