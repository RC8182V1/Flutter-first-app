import 'package:firstapp/apps/weather/models/weatherModel.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/apps/weather/components/weatherDisplay.dart';
import 'package:firstapp/apps/weather/provider/weatherProvider.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {Key? key, required WeatherModel weather, required this.direction})
      : super(key: key);
  final String direction;

  @override
  Widget build(BuildContext context) {
    Axis flexDirection =
        direction == 'column' ? Axis.vertical : Axis.horizontal;
    WeatherModel weather = Provider.of<WeatherProvider>(context).currentWeather;
    print(weather.temperature);
    return IntrinsicWidth(
      child: Container(
        margin: EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(66, 59, 51, 51),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Flex(
          direction: flexDirection,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Weather forecast',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  icon: const Icon(Icons.refresh_sharp),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
            WeatherDisplay(
              icon: weather.icon,
              temperature: weather.temperature,
              dayState: weather.dayState,
              weatherStatus: weather.weatherStatus,
            ),
            SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
