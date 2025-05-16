import 'package:flutter/material.dart';
import 'package:flutter_code_with_gemini/src/routing/app_router.dart'; // Import the AppRouter

// Global ValueNotifier to hold the current theme mode
final ValueNotifier<ThemeMode> themeNotifier =
    ValueNotifier(ThemeMode.system);

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
        // Define a seed color for your theme
        const seedColor = Colors.blue;

        // Define the light theme
        final lightTheme = ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: seedColor,
            brightness: Brightness.light,
          ),
          textTheme: const TextTheme(
            // Example: Define a style for displayLarge
            displayLarge:
                TextStyle(fontSize: 57.0, fontWeight: FontWeight.bold),
            // Add other text styles as needed
          ),
          useMaterial3: true,
        );

        // Define the dark theme
        final darkTheme = ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: seedColor,
            brightness: Brightness.dark, // Important for dark theme
          ),
          textTheme: const TextTheme(
            // Example: Define a style for displayLarge for dark theme
            displayLarge:
                TextStyle(fontSize: 57.0, fontWeight: FontWeight.bold),
            // Add other text styles as needed, potentially with different colors
          ),
          useMaterial3: true,
        );

        return MaterialApp.router(
          title: 'flutter_code_with_gemini',
          debugShowCheckedModeBanner: false, // Hide the debug banner
          theme: lightTheme, // Set the light theme
          darkTheme: darkTheme, // Set the dark theme
          themeMode: currentMode, // Use the current mode from the notifier
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
