// Import necessary packages and files for the Flutter application.
import 'package:firstapp/apps/randomWords/components/pages/favoritePage.dart';
import 'package:firstapp/apps/randomWords/context/contextState.dart';
import '../bigCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Define a StatefulWidget named HomePage to manage the main UI of the application.
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

// Define the state class _HomePageState associated with HomePage.
class _HomePageState extends State<HomePage> {
  var selectedIndex = 0; // Variable to keep track of the selected tab index.

  // Build the widget tree for the HomePage.
  @override
  Widget build(BuildContext context) {
    Widget
        page; // Variable to store the current page widget based on selectedIndex.

    // Determine the appropriate widget to display based on the selected index.
    switch (selectedIndex) {
      case 0:
        page = BodyPage(); // Show the BodyPage widget for index 0.
        break;
      case 1:
        page = FavoritePage(); // Show the FavoritePage widget for index 1.
        break;
      default:
        throw UnimplementedError(
            'no widget for $selectedIndex'); // Handle unimplemented indices.
    }

    // Use LayoutBuilder to adapt the UI based on the available screen width.
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Random Words App'), // Set the app bar title.
          centerTitle: true, // Center the app bar title.
          backgroundColor: Colors.cyan, // Set the app bar background color.
        ),
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >=
                    600, // Extend the navigation rail for wider screens.
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home), // Home icon for the first tab.
                    label: Text('Home'), // Label for the first tab.
                  ),
                  NavigationRailDestination(
                    icon: Icon(
                        Icons.favorite), // Favorite icon for the second tab.
                    label: Text('Favorites'), // Label for the second tab.
                  ),
                ],
                selectedIndex:
                    selectedIndex, // Set the selected index for the navigation rail.
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex =
                        value; // Update the selected index when a tab is selected.
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context)
                    .colorScheme
                    .primaryContainer, // Set the background color of the container.
                child:
                    page, // Display the selected page widget inside the container.
              ),
            ),
          ],
        ),
      );
    });
  }
}

// Define a StatelessWidget named BodyPage to display the main content of the application.
class BodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState =
        context.watch<MyAppState>(); // Access the app state using the provider.
    var pair = appState.current; // Get the current WordPair from the app state.
    IconData
        icon; // Variable to store the icon based on WordPair's favorite status.

    // Determine the appropriate icon based on whether the WordPair is in favorites or not.
    if (appState.favorites.contains(pair)) {
      icon = Icons
          .favorite; // Set the icon to filled heart if WordPair is in favorites.
    } else {
      icon = Icons
          .favorite_border; // Set the icon to empty heart if WordPair is not in favorites.
    }

    // Build the UI with the WordPair, like button, and next button.
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair), // Display the WordPair using the BigCard widget.
          SizedBox(height: 10), // Add vertical spacing.
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState
                      .toggleFavorite(); // Toggle the favorite status of the WordPair.
                },
                icon: Icon(
                    icon), // Display the appropriate icon based on favorite status.
                label: Text('Like'), // Label for the like button.
              ),
              SizedBox(width: 10), // Add horizontal spacing between buttons.
              ElevatedButton(
                onPressed: () {
                  appState.getNext(); // Get the next random WordPair.
                },
                child: Text('Next'), // Label for the next button.
              ),
            ],
          ),
        ],
      ),
    );
  }
}
