import 'package:flutter/material.dart';
import 'package:flutter_code_with_gemini/src/constants/themes.dart'; // Import the AppTheme
import 'package:flutter_code_with_gemini/src/routing/app_router.dart'; // Import the AppRouter

// Global ValueNotifier to hold the current theme mode
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.dark);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        // Define the light theme
        final lightTheme = AppTheme.lightsOn;

        // Define the dark theme
        final darkTheme = AppTheme.lightsOut;

        return MaterialApp.router(
          title: 'flutter_code_with_gemini',
          debugShowCheckedModeBanner: false, // Hide the debug banner
          theme: lightTheme, // Set the light theme
          darkTheme: darkTheme, // Set the dark theme
          themeMode: currentMode, // Use the current mode from the notifier
          themeAnimationDuration: const Duration(
              milliseconds: 1500), // Duration of the theme change animation
          themeAnimationCurve:
              Curves.easeInOut, // Curve for the theme change animation
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
