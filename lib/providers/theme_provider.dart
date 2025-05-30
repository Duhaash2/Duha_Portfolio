import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:duha_portfolio/utils/app_themes.dart'; // Import AppThemes enum

class ThemeProvider with ChangeNotifier {
  static const String _themePrefKey = 'theme_preference_v2'; // Use new key for enum
  AppTheme _currentTheme = AppTheme.blue; // Default theme

  ThemeData get currentThemeData => AppThemes.getThemeData(_currentTheme);
  AppTheme get currentThemeEnum => _currentTheme;

  ThemeProvider() {
    _loadThemePreference();
  }

  bool get isDarkMode {
    // Determine if the current theme's ThemeData is dark
    return currentThemeData.brightness == Brightness.dark;
  }

  Future<void> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final themeName = prefs.getString(_themePrefKey) ?? AppTheme.blue.name;
    try {
      _currentTheme = AppTheme.values.firstWhere((e) => e.name == themeName);
    } catch (e) {
      _currentTheme = AppTheme.blue; // Default if saved theme name is invalid
    }
    notifyListeners();
  }

  Future<void> setTheme(AppTheme theme) async {
    if (_currentTheme == theme) return;
    _currentTheme = theme;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themePrefKey, theme.name);
  }

  // Keep toggleTheme for potential future use with a simple light/dark switch
  // but primary control is now via setTheme(AppTheme theme)
  void toggleTheme(bool turnDark) {
     // This simple toggle might not map perfectly to multiple themes.
     // Consider removing or adapting if only specific themes have dark modes.
     // For now, let's switch between blue light and blue dark as an example.
    if (turnDark) {
      setTheme(AppTheme.blueDark);
    } else {
      setTheme(AppTheme.blue);
    }
  }
}

