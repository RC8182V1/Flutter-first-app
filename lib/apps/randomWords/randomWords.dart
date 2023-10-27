// Import the necessary packages and files for the Flutter application.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'context/contextState.dart'; // Import the state management class (MyAppState).
import 'components/pages/mainPage.dart'; // Import the main page of the application.

// Define a StatelessWidget named RandomWords to create the application UI.
class RandomWords extends StatelessWidget {
  // Constructor for the RandomWords class.
  const RandomWords({Key? key});

  // Override the build method to define the structure of the widget tree.
  @override
  Widget build(BuildContext context) {
    // Wrap the entire application with ChangeNotifierProvider to provide the state management using MyAppState.
    return ChangeNotifierProvider(
      // Create an instance of MyAppState to manage the application state.
      create: (context) => MyAppState(),
      // Create a MaterialApp widget for the application UI.
      child: MaterialApp(
        debugShowCheckedModeBanner:
            false, // Hide the debug banner in the top-right corner.
        title:
            'firstapp', // Set the application title displayed in the app switcher.
        theme: ThemeData(
          useMaterial3: true, // Enable the use of Material 3 design components.
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors
                  .cyan), // Set the primary color scheme for the application.
        ),
        home:
            HomePage(), // Set the initial page of the application to HomePage.
      ),
    );
  }
}
