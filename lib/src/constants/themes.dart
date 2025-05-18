import 'package:flutter/material.dart';
import 'package:flutter_code_with_gemini/src/constants/colors.dart'; // Import AppColors
import 'package:flutter_code_with_gemini/src/constants/text_styles.dart'; // Import AppTextStyle

class AppTheme {
  // App light theme data
  static ThemeData lightsOn = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.lightSeedColor,
      brightness: Brightness.light,
    ),
    textTheme: const TextTheme(
      // Example: Define a style for displayLarge
      displayLarge: AppTextStyle.kXXXLargeLabel,
      // Add other text styles as needed
    ),
    useMaterial3: true,
  );

  // App dark theme data
  static ThemeData lightsOut = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.darkSeedColor,
      brightness: Brightness.dark, // Important for dark theme
    ),
    textTheme: const TextTheme(
      // Example: Define a style for displayLarge for dark theme
      displayLarge: AppTextStyle.kXXXLargeLabel,
      // Add other text styles as needed, potentially with different colors
    ),
    useMaterial3: true,
  );
}
