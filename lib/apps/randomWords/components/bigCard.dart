// Import necessary packages and files for the Flutter application.
import 'package:english_words/english_words.dart';  // Import WordPair class for generating random word pairs.
import 'package:flutter/material.dart';

// Define a StatelessWidget named BigCard to create a card widget displaying a WordPair.
class BigCard extends StatelessWidget {
  const BigCard({
    Key? key,  // Key object for widget identification and state persistence.
    required this.pair,  // Required parameter representing the WordPair to be displayed.
  }) : super(key: key);

  final WordPair pair;  // Store the WordPair passed to the widget.

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);  // Access the current theme of the app.
    
    // Define the text style for the displayed WordPair.
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,  // Set text color based on the color scheme.
    );

    // Return a Card widget containing the WordPair text inside a Padding widget.
    return Card(
      color: theme.colorScheme.primary,  // Set the background color of the card.
      child: Padding(
        padding: const EdgeInsets.all(20),  // Apply padding around the WordPair text.

        // Display the WordPair text inside a Text widget with the specified style and semantics label.
        child: Text(
          pair.asLowerCase,  // Display the WordPair in lowercase.
          style: style,  // Apply the defined text style.
          semanticsLabel: "${pair.first} ${pair.second}",  // Provide semantic information for accessibility.
        ),
      ),
    );
  }
}
