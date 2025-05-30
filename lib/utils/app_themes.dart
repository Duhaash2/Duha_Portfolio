import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart'; // Import constants

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
  // Helper to get ThemeData based on enum
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

  // Base theme builder
  static ThemeData _buildTheme({
    required Brightness brightness,
    required Color primary,
    required Color secondary,
    required Color background,
    required Color surface,
    required Gradient gradient,
  }) {
    final bool isDark = brightness == Brightness.dark;
    final Color onPrimary = isDark ? Colors.black : Colors.white;
    final Color onSecondary = isDark ? Colors.white : Colors.black;
    final Color onBackground = isDark ? Colors.white70 : Colors.black87;
    final Color onSurface = isDark ? Colors.white70 : Colors.black87;
    final Color cardColor = surface;

    final baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      primaryColor: primary,
      scaffoldBackgroundColor: background,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: primary,
        onPrimary: onPrimary,
        secondary: secondary,
        onSecondary: onSecondary,
        error: AppColors.errorColor,
        onError: Colors.white,
        background: background,
        onBackground: onBackground,
        surface: surface,
        onSurface: onSurface,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: isDark ? surface : primary, // Dark themes use surface color for AppBar
        elevation: 0,
        iconTheme: IconThemeData(color: isDark ? Colors.white : onPrimary),
        titleTextStyle: GoogleFonts.lato(
          color: isDark ? Colors.white : onPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      textTheme: GoogleFonts.latoTextTheme(
        baseTheme.textTheme,
      ).apply(bodyColor: onSurface, displayColor: onSurface),
      cardTheme: CardTheme(
        elevation: isDark ? 4 : 2,
        margin: const EdgeInsets.symmetric(vertical: AppPadding.p8, horizontal: AppPadding.p16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.r12)),
        color: cardColor, // Use surface color for cards
        // Add gradient decoration via custom Card widget if needed, direct theme support is limited
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primary,
        unselectedItemColor: Colors.grey,
        backgroundColor: surface,
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primary,
        foregroundColor: onPrimary,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: secondary.withOpacity(0.1),
        disabledColor: Colors.grey.withOpacity(0.5),
        selectedColor: primary,
        secondarySelectedColor: primary,
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12, vertical: AppPadding.p8),
        labelStyle: TextStyle(color: secondary),
        secondaryLabelStyle: TextStyle(color: onPrimary),
        brightness: brightness,
      ),
      // Store gradient in extensions for easy access in widgets
      extensions: <ThemeExtension<dynamic>>[
        AppThemeGradients(cardGradient: gradient),
      ],
    );
  }
}

// Theme extension to hold gradients
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
    if (other is! AppThemeGradients) {
      return this;
    }
    return AppThemeGradients(
      cardGradient: Gradient.lerp(cardGradient, other.cardGradient, t)!,
    );
  }
}

