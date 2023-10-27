// Import necessary packages and files for the FavoritePage widget.
import 'package:flutter/material.dart';
import 'package:firstapp/apps/randomWords/context/contextState.dart'; // Import the app state management class.

import 'package:provider/provider.dart'; // Import Provider for state management.

// Define a StatelessWidget named FavoritePage to display the favorite WordPairs.
class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key}) : super(key: key);

  // Build the widget tree for the FavoritePage.
  @override
  Widget build(BuildContext context) {
    final appState =
        context.watch<MyAppState>(); // Access the app state using the provider.

    // Return a ListView widget displaying the favorite WordPairs.
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'), // Display the number of favorite WordPairs.
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons
                .favorite), // Display a heart icon for each favorite WordPair.
            title: Text(pair
                .asLowerCase), // Display the favorite WordPair in lowercase.
          ),
      ],
    );
  }
}
