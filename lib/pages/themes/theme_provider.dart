import 'package:flutter/material.dart';
import 'package:u_tweet/pages/themes/dark_mode.dart';
import 'package:u_tweet/pages/themes/light_mode.dart';

class ThemeProvider with ChangeNotifier {
  // Initially set to light mode
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  // Method to toggle theme
  void toggleTheme() {
    if (_themeData == darkMode) {
      _themeData = lightMode;
    } else {
      _themeData = darkMode;
    }
    notifyListeners();
  }
}
