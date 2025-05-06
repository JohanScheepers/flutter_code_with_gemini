import 'package:flutter/material.dart';
import 'package:flutter_code_with_gemini/src/routing/app_router.dart'; // Import the AppRouter

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'flutter_code_with_gemini',
      debugShowCheckedModeBanner: false, // Hide the debug banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue), // You can choose any color
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
