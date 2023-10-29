import 'package:firstapp/apps/weather/provider/weatherProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherDisplay extends StatelessWidget {
  const WeatherDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weather = context.watch<WeatherProvider>();
    double temperature = weather.currentWeather.temperature;
    String weatherStatus = weather.currentWeather.weatherStatus;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          weather.currentWeather.icon,
          SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(weather.currentWeather.dayState,
                  style: TextStyle(color: Colors.white)),
              Text('Temperature: $temperature',
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
