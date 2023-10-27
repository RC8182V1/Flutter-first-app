import 'package:firstapp/apps/weather/provider/weatherProvider.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/dashboard.dart';
import 'package:provider/provider.dart'; // Import the provider package

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => WeatherProvider()), 
          // Add other providers if needed
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // Fetch weather data when the widget is initialized
    Provider.of<WeatherProvider>(context, listen: false).fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Three Screens App',
      home: Dashboard(),
    );
  }
}
