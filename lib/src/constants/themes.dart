import 'package:flutter/material.dart';
import 'package:flutter_code_with_gemini/src/constants/colors.dart'; // Import AppColors
import 'package:flutter_code_with_gemini/src/constants/text_styles.dart'; // Import AppTextStyle
import 'package:flutter_code_with_gemini/src/constants/ui_constants.dart'; // Import AppConstants

class AppTheme {
  // App light theme data (lightsOn)
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
    tooltipTheme: TooltipThemeData(
      textStyle: AppTextStyle.kSMediumLabel,
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(kSizeSmall),
      ),
    ),
    useMaterial3: true,
  );

  // App dark theme data (lightsOut)
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
    tooltipTheme: TooltipThemeData(
      textStyle: AppTextStyle.kSMediumLabel,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(kSizeSmall),
      ),
    ),
    useMaterial3: true,
  );
}
