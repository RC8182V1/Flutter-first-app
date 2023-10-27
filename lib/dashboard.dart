// Import necessary packages and files for the Dashboard widget.
import 'package:firstapp/apps/counter/counter.dart';
import 'package:firstapp/apps/randomWords/randomWords.dart';
import 'package:firstapp/apps/weather/weather.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/components/appsContainer.dart';

// Define a StatelessWidget named Dashboard to create the main screen of the application.
class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Three in One App'), // Set the app bar title.
        elevation: 10, // Set the elevation of the app bar.
      ),
      body: PageView(
        children: [
          MyScreen(), // Display the content of MyScreen widget inside the PageView.
        ],
      ),
    );
  }
}

// Define a StatelessWidget named MyScreen to display the main content of the dashboard.
class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Determine the direction based on screen width.
          Axis direction =
              constraints.maxWidth < 900 ? Axis.vertical : Axis.horizontal;

          // Calculate the container height based on screen height.
          double screenHeight = constraints.maxHeight;
          double containerHeight = screenHeight * 1;

          return ListView(
            children: [
              Container(
                  alignment: Alignment.center,
                  color: Color.fromRGBO(22, 96, 100,
                      1), // Set the background color of the container.
                  height:
                      screenHeight * 0.1, // Set the height of the container.

                  child: Text('Apps by: @javi')),
              Container(
                margin: EdgeInsets.all(8.0), // Apply margin to the container.
                width: constraints.minWidth, // Set the width of the container.
                height:
                    constraints.maxHeight, // Set the height of the container.
                color: Colors
                    .blue[300], // Set the background color of the container.
                child: Flex(
                  direction:
                      direction, // Set the direction of the Flex widget based on the calculated direction.
                  children: [
                    AppsContainer(
                      containerHeight:
                          containerHeight, // Pass the calculated container height to AppsContainer.
                      app:
                          Counter(), // Display the Counter app inside AppsContainer.
                    ),
                    AppsContainer(
                      containerHeight:
                          containerHeight, // Pass the calculated container height to AppsContainer.
                      app:
                          RandomWords(), // Display the RandomWords app inside AppsContainer.
                    ),
                    AppsContainer(
                      containerHeight:
                          containerHeight, // Pass the calculated container height to AppsContainer.
                      app:
                          Weather(), // Display the Weather app inside AppsContainer.
                    ),
                  ],
                ),
              ),
              Container(
                  color: Color.fromRGBO(22, 96, 100, 1),
                  height: screenHeight *
                      0.25), // Set the background color and height of the container.
            ],
          );
        },
      ),
    );
  }
}
