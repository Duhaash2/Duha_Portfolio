import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:duha_portfolio/utils/app_themes.dart'; // Your enum & theme data

class ThemeProvider with ChangeNotifier {
  static const String _themePrefKey = 'theme_preference_v2';

  // ✅ Default theme is dark
  AppTheme _currentTheme = AppTheme.blueDark;

  ThemeData get currentThemeData => AppThemes.getThemeData(_currentTheme);
  AppTheme get currentThemeEnum => _currentTheme;

  ThemeProvider() {
    _loadThemePreference();
  }

  bool get isDarkMode =>
      currentThemeData.brightness == Brightness.dark;

  Future<void> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final themeName = prefs.getString(_themePrefKey);

    if (themeName != null) {
      try {
        _currentTheme = AppTheme.values.firstWhere((e) => e.name == themeName);
      } catch (e) {
        _currentTheme = AppTheme.blueDark; // Fallback
      }
    } else {
      _currentTheme = AppTheme.blueDark; // First run default
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

  void toggleTheme(bool turnDark) {
    // Example: toggle between light/dark variants of blue
    if (turnDark) {
      setTheme(AppTheme.blueDark);
    } else {
      setTheme(AppTheme.blue);
    }
  }
}
