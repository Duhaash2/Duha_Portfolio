import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:duha_portfolio/providers/theme_provider.dart';

class ThemeSwitcher extends StatelessWidget {
  final ThemeProvider themeProvider;

  const ThemeSwitcher({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        themeProvider.toggleTheme(value);
      },
      // Optionally customize active/inactive colors based on theme
      // activeColor: Theme.of(context).colorScheme.primary,
    );
  }
}

