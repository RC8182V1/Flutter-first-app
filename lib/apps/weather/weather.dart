import 'package:firstapp/apps/weather/models/weatherModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/CustomCard.dart';
import 'package:firstapp/apps/weather/provider/weatherProvider.dart'; // Import your WeatherProvider

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var weatherProvider = Provider.of<WeatherProvider>(context);
    WeatherModel currentWeather = weatherProvider.currentWeather;

    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text('Weather App'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(children: [
          CustomCard(weather: currentWeather, direction: 'row'),
          CustomCard(weather: currentWeather, direction: 'column'),
        ]),
      ),
    );
  }
}
