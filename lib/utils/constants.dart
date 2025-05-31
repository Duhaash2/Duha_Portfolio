import 'package:flutter/material.dart';

// Define consistent colors, padding, radius etc.

class AppColors {
  // Common Colors
  static const Color backgroundLight = Color(0xFFF2F2F7);
  static const Color surfaceLight = Colors.white;
  static const Color backgroundDark = Color(0xFF000000);
  static const Color surfaceDark = Color(0xFF1C1C1E);
  static const Color errorColor = Colors.redAccent;

  // Blue Theme Colors (Original)
  static const Color primaryBlueLight = Color(0xFF83B5EF);
  static const Color secondaryBlueLight = Color(0xFF34BDEC);
  static const Color primaryBlueDark = Color(0xFF3F4045);
  static const Color secondaryBlueDark = Color(0xFF036D97);

  // Green Theme Colors (Vibrant)
  static const Color primaryGreenLight = Color(0xFF4F7757); // Vibrant Green
  static const Color secondaryGreenLight = Color(0xFF3A8C4C);
  static const Color primaryGreenDark = Color(0xFF1C812F);
  static const Color secondaryGreenDark = Color(0xFF2BAC4C);

  // Purple Theme Colors (Deep)
  static const Color primaryPurpleLight = Color(0xFF5856D6); // Deep Purple
  static const Color secondaryPurpleLight = Color(0xFF9247B8);
  static const Color primaryPurpleDark = Color(0xFF742D9C);
  static const Color secondaryPurpleDark = Color(0xFFA679C6);
}

class AppGradients {
  // Blue Gradients
  static const Gradient blueLightGradient = LinearGradient(
    colors: [AppColors.primaryBlueLight, AppColors.secondaryBlueLight],
    begin: Alignment.topLeft, end: Alignment.bottomRight,
  );
  static const Gradient blueDarkGradient = LinearGradient(
    colors: [AppColors.primaryBlueDark, AppColors.secondaryBlueDark],
    begin: Alignment.topLeft, end: Alignment.bottomRight,
  );

  // Green Gradients
  static const Gradient greenLightGradient = LinearGradient(
    colors: [AppColors.primaryGreenLight, AppColors.secondaryGreenLight],
    begin: Alignment.topLeft, end: Alignment.bottomRight,
  );
  static const Gradient greenDarkGradient = LinearGradient(
    colors: [AppColors.primaryGreenDark, AppColors.secondaryGreenDark],
    begin: Alignment.topLeft, end: Alignment.bottomRight,
  );

  // Purple Gradients
  static const Gradient purpleLightGradient = LinearGradient(
    colors: [AppColors.primaryPurpleLight, AppColors.secondaryPurpleLight],
    begin: Alignment.topLeft, end: Alignment.bottomRight,
  );
  static const Gradient purpleDarkGradient = LinearGradient(
    colors: [AppColors.primaryPurpleDark, AppColors.secondaryPurpleDark],
    begin: Alignment.topLeft, end: Alignment.bottomRight,
  );
}


class AppPadding {
  static const double p4 = 4.0;
  static const double p8 = 8.0;
  static const double p12 = 12.0;
  static const double p16 = 16.0;
  static const double p20 = 20.0;
  static const double p24 = 24.0;
}

class AppRadius {
  static const double r4 = 4.0;
  static const double r8 = 8.0;
  static const double r12 = 12.0;
  static const double r16 = 16.0;
}

class AppSizes {
  static const double iconSizeSmall = 18.0;
  static const double iconSizeMedium = 24.0;
  static const double iconSizeLarge = 32.0;
}

// Add other constants like text styles if needed

