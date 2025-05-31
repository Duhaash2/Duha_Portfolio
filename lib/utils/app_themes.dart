import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart'; // Import your constants (colors, padding, etc.)

// Enum to represent the available themes
enum AppTheme {
  blue,
  blueDark,
  green,
  greenDark,
  purple,
  purpleDark,
}

class AppThemes {
  // Return ThemeData based on selected AppTheme
  static ThemeData getThemeData(AppTheme theme) {
    switch (theme) {
      case AppTheme.blue:
        return _buildTheme(
          brightness: Brightness.light,
          primary: AppColors.primaryBlueLight,
          secondary: AppColors.secondaryBlueLight,
          background: AppColors.backgroundLight,
          surface: AppColors.surfaceLight,
          gradient: AppGradients.blueLightGradient,
        );
      case AppTheme.blueDark:
        return _buildTheme(
          brightness: Brightness.dark,
          primary: AppColors.primaryBlueDark,
          secondary: AppColors.secondaryBlueDark,
          background: AppColors.backgroundDark,
          surface: AppColors.surfaceDark,
          gradient: AppGradients.blueDarkGradient,
        );
      case AppTheme.green:
        return _buildTheme(
          brightness: Brightness.light,
          primary: AppColors.primaryGreenLight,
          secondary: AppColors.secondaryGreenLight,
          background: AppColors.backgroundLight,
          surface: AppColors.surfaceLight,
          gradient: AppGradients.greenLightGradient,
        );
      case AppTheme.greenDark:
        return _buildTheme(
          brightness: Brightness.dark,
          primary: AppColors.primaryGreenDark,
          secondary: AppColors.secondaryGreenDark,
          background: AppColors.backgroundDark,
          surface: AppColors.surfaceDark,
          gradient: AppGradients.greenDarkGradient,
        );
      case AppTheme.purple:
        return _buildTheme(
          brightness: Brightness.light,
          primary: AppColors.primaryPurpleLight,
          secondary: AppColors.secondaryPurpleLight,
          background: AppColors.backgroundLight,
          surface: AppColors.surfaceLight,
          gradient: AppGradients.purpleLightGradient,
        );
      case AppTheme.purpleDark:
        return _buildTheme(
          brightness: Brightness.dark,
          primary: AppColors.primaryPurpleDark,
          secondary: AppColors.secondaryPurpleDark,
          background: AppColors.backgroundDark,
          surface: AppColors.surfaceDark,
          gradient: AppGradients.purpleDarkGradient,
        );
    }
  }

  // Base method to build all themes
  static ThemeData _buildTheme({
    required Brightness brightness,
    required Color primary,
    required Color secondary,
    required Color background,
    required Color surface,
    required Gradient gradient,
  }) {
    final bool isDark = brightness == Brightness.dark;

    final baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      primaryColor: primary,
      scaffoldBackgroundColor: background,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: primary,
        onPrimary: isDark ? Colors.black : Colors.white,
        secondary: secondary,
        onSecondary: isDark ? Colors.white : Colors.black,
        error: AppColors.errorColor,
        onError: Colors.white,
        background: background,
        onBackground: isDark ? Colors.white70 : Colors.black87,
        surface: surface,
        onSurface: isDark ? Colors.white70 : Colors.black87,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: isDark ? surface : primary,
        elevation: 0,
        iconTheme: IconThemeData(
          color: isDark ? Colors.white : Colors.white,
        ),
        titleTextStyle: GoogleFonts.lato(
          color: isDark ? Colors.white : Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme).apply(
        bodyColor: isDark ? Colors.white70 : Colors.black87,
        displayColor: isDark ? Colors.white70 : Colors.black87,
      ),
      cardTheme: CardTheme(
        elevation: isDark ? 4 : 2,
        margin: const EdgeInsets.symmetric(
          vertical: AppPadding.p8,
          horizontal: AppPadding.p16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.r12),
        ),
        color: surface,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primary,
        unselectedItemColor: Colors.grey,
        backgroundColor: surface,
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primary,
        foregroundColor: isDark ? Colors.black : Colors.white,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: secondary.withOpacity(0.1),
        disabledColor: Colors.grey.withOpacity(0.5),
        selectedColor: primary,
        secondarySelectedColor: primary,
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p12,
          vertical: AppPadding.p8,
        ),
        labelStyle: TextStyle(color: secondary),
        secondaryLabelStyle: TextStyle(color: isDark ? Colors.white : Colors.black),
        brightness: brightness,
      ),
      extensions: <ThemeExtension<dynamic>>[
        AppThemeGradients(cardGradient: gradient),
      ],
    );
  }
}

// Theme extension to access gradient in themed widgets
@immutable
class AppThemeGradients extends ThemeExtension<AppThemeGradients> {
  const AppThemeGradients({
    required this.cardGradient,
  });

  final Gradient cardGradient;

  @override
  AppThemeGradients copyWith({Gradient? cardGradient}) {
    return AppThemeGradients(
      cardGradient: cardGradient ?? this.cardGradient,
    );
  }

  @override
  AppThemeGradients lerp(ThemeExtension<AppThemeGradients>? other, double t) {
    if (other is! AppThemeGradients) return this;
    return AppThemeGradients(
      cardGradient: Gradient.lerp(cardGradient, other.cardGradient, t)!,
    );
  }
}
