import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

// Define a class named MyAppState that extends ChangeNotifier.
class MyAppState extends ChangeNotifier {
  // Variable that stores a random WordPair. WordPair is a class from the 'english_words' package representing a random pair of words.
  var current = WordPair.random();
  
  // Method that updates the 'current' variable with a new random WordPair and notifies widgets depending on this state.
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
  
  // List that stores WordPairs marked as favorites by the user.
  var favorites = <WordPair>[];

  // Method that toggles the favorite state of the current WordPair. If it's in 'favorites', it is removed from the list; otherwise, it's added to the list.
  // Then, it notifies widgets depending on this state.
  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}
